# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Yarn global installed binaries
export PATH="$(yarn global bin):$PATH"

# Load Composer global installed binaries
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Load Apollo rover cli
export PATH="$HOME/.rover/bin:$PATH"

# Use project specific binaries after global ones
export PATH="$PATH:node_modules/.bin:vendor/bin"

# Python pip packages
export PATH="$HOME/Library/Python/3.7/bin:$HOME/Library/Python/2.7/bin:$PATH"

# Make sure PHP 7.1 is loaded
export XDEBUG_CONFIG="ideKey=VSCODE"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

# Load custom commands
# Disabled this because I have no custom binaries at the moment.
# export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.scripts:$PATH";

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Mysql binaries
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
