#!/bin/sh

echo "Setting up your Mac..."

DOTFILES=$HOME/.dotfiles

# Check for Homebrew and install if we don't have it
if ! command -v brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# Global gitignore
ln -sf $DOTFILES/.gitignore_global $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle install --file $DOTFILES/Brewfile

# Set default MySQL root password and auth type
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Fix required library for pecl extensions
# ln -s /opt/homebrew/Cellar/pcre2/$(brew info --json pcre2 | jq '.[0].installed[0].version')/include/pcre2.h /opt/homebrew/Cellar/php/$(brew info --json php | jq '.[0].installed[0].version')/include/php/ext/pcre/pcre2.h

# Install Composer (official installer, https://getcomposer.org/download/)
if ! command -v composer > /dev/null; then
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  sudo mkdir -p /usr/local/bin
  sudo php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
  rm composer-setup.php
fi

# Pin Composer's home: it would otherwise fall back to the legacy ~/.composer
# if that directory exists. Matches path.zsh and mackup/composer.cfg.
export COMPOSER_HOME=$HOME/.config/composer

# Install global Composer packages
composer global require laravel/valet beyondcode/expose spatie/global-ray spatie/visit

# Install Laravel Valet
$COMPOSER_HOME/vendor/bin/valet install

# Install Global Ray
$COMPOSER_HOME/vendor/bin/global-ray install

# Create a projects directory
mkdir -p $HOME/projects

# Create a scripts directory
mkdir -p $HOME/.scripts

# Symlink the Mackup config file to the home directory
ln -sf $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Custom Mackup app definitions (override the bundled ones with the same name)
mkdir -p $HOME/.mackup
ln -sf $DOTFILES/mackup/composer.cfg $HOME/.mackup/composer.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
