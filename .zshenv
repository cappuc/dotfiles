# Shared environment for interactive shells and agent processes.
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
source "$DOTFILES/path.zsh"

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
export PATH="$HOME/.nub/shims:$PATH"
