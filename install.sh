#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Php
pecl install xdebug

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet spatie/http-status-check spatie/mixed-content-scanner-cli laravel/envoy

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/projects

# Setup zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos
