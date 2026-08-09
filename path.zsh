# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# Load Composer tools
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Set pnpm global store
export PNPM_HOME="/Users/fabio/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Load Yarn global installed binaries
export PATH="/opt/homebrew/bin:$PATH"

# Load Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Load Go binaries
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Load Python pip packages
export PATH="$HOME/Library/Python/3.7/bin:$HOME/Library/Python/2.7/bin:$PATH"

# Load ruby from homebrew
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Load home binaries
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.config/phpmon/bin:$HOME/.pub-cache/bin:$PATH

# Load Apollo rover cli
export PATH="$HOME/.rover/bin:$PATH"

# Load Jetbrains scripts
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# Load kubectl krew
export PATH="$HOME/.krew/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Load custom commands
export PATH="$HOME/.scripts:$PATH";

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Set NODE_PATH
export NODE_PATH=/opt/homebrew/lib/node_modules
