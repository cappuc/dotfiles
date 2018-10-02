# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Yarn global installed binaries
export PATH="$(yarn global bin):$PATH"

# Load Composer global installed binaries
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Python pip packages
export PATH="$HOME/Library/Python/3.7/bin:$HOME/Library/Python/2.7/bin:$PATH"

# Make sure PHP 7.1 is loaded
export XDEBUG_CONFIG="ideKey=VSCODE"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load custom commands
# Disabled this because I have no custom binaries at the moment.
# export PATH="$DOTFILES/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
