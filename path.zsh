# Keep PATH free of duplicates when this file is re-sourced (nested shells,
# tmux, `reloadshell`). Must come before any PATH manipulation below.
typeset -U path PATH

# Load dotfiles binaries
# export PATH="$DOTFILES/bin:$PATH"

# Load Composer tools. COMPOSER_HOME is pinned explicitly because Composer falls
# back to the legacy ~/.composer whenever that directory happens to exist.
# mackup/composer.cfg syncs this same XDG path.
export COMPOSER_HOME="$HOME/.config/composer"
export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

# Set pnpm global store
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Homebrew (also set by `brew shellenv` in .zprofile, kept for non-login shells)
export PATH="/opt/homebrew/bin:$PATH"

# Load Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Load Go binaries
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Load ruby from homebrew
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
  # Gem dir is hardcoded on purpose: `gem environment gemdir` costs ~80ms at
  # every shell start. Update this after a major Ruby upgrade (3.3.0 -> x.y.z).
  export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
fi

# Load home binaries
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.config/phpmon/bin:$PATH"

# Load Jetbrains scripts
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# Load kubectl krew
export PATH="$HOME/.krew/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Load custom commands
export PATH="$HOME/.scripts:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Set NODE_PATH
export NODE_PATH=/opt/homebrew/lib/node_modules
