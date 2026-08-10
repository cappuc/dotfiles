#!/bin/sh

echo "Setting up your Mac..."

DOTFILES=$HOME/.dotfiles

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# Install rosetta 2
if [[ $(uname -m) == 'arm64' ]]; then
  sudo softwareupdate --install-rosetta
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Set default MySQL root password and auth type
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Fix required library for pecl extensions
ln -s /opt/homebrew/Cellar/pcre2/$(brew info --json pcre2 | jq '.[0].installed[0].version')/include/pcre2.h /opt/homebrew/Cellar/php/$(brew info --json php | jq '.[0].installed[0].version')/include/php/ext/pcre/pcre2.h
 
# Install PHP extensions with PECL
pecl install imagick redis grpc protobuf

# Install global Composer packages
/opt/homebrew/bin/composer global require laravel/installer laravel/valet beyondcode/expose spatie/global-ray spatie/visit tightenco/takeout

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install Global Ray
$HOME/.composer/vendor/bin/global-ray install

# Create a projects directory
mkdir $HOME/projects

# Create a scripts directory
mkdir $HOME/.scripts

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
