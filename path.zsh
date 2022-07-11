# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Yarn global installed binaries
export PATH="$(yarn global bin):$PATH"

# Load Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Load Go binaries
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Load Python pip packages
export PATH="$HOME/Library/Python/3.7/bin:$HOME/Library/Python/2.7/bin:$PATH"

# Load Apollo rover cli
export PATH="$HOME/.rover/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Load custom commands
export PATH="$HOME/.scripts:$PATH";

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
