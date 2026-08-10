# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Directory navigation
setopt auto_cd auto_pushd pushd_ignore_dups

# Completion (compinit itself runs at the end, after fpath is complete)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Load dotfiles config. Order matters: path.zsh exports vars the aliases use.
source $DOTFILES/path.zsh
source $DOTFILES/history.zsh
source $DOTFILES/aliases.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=it_IT.UTF-8
export LANG=it_IT.UTF-8

# Fallback to xterm-256 for ssh connections
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Personal aliases live in $DOTFILES/aliases.zsh (sourced above).
# For a full list of active aliases, run `alias`.

# pnpm: PNPM_HOME lives in path.zsh

# Java/Android
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export JAVA_HOME="/Users/fabio/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk | tail -n 1)"
export NDK_HOST_TAG="darwin-x86_64"
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$NDK_HOME

# rust
# export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
export LDFLAGS=-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
# export GSTREAMER_ROOT_ANDROID=/Users/fabio/projects/lib/gstreamer-1.0-android-universal-1.26.1
# export GSTREAMER_ROOT_WINDOWS=/Users/fabio/projects/lib/gstreamer-1.0-devel-msvc-x86_64-1.26.1
export GSTREAMER_ROOT_WINDOWS=/Volumes/T7B/dev/lib/gstreamer-1.0-devel-msvc-x86_64-1.26.1

# gstreamer
export GST_PLUGIN_PATH="/opt/homebrew/opt/aravis/lib/gstreamer-1.0:${GST_PLUGIN_PATH}"

# bun completions
[ -s "/Users/fabio/.bun/_bun" ] && source "/Users/fabio/.bun/_bun"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

eval "$(starship init zsh)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/fabio/.docker/completions $fpath)
# Full compinit (with its security scan + cache rebuild) costs ~230ms, so run it
# only once a day; every other start reuses the dump via -C for ~10ms.
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# End of Docker CLI completions

# Fish-like suggestions from history (→ or End to accept). Must load after compinit.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# lean-ctx shell hook — begin
if [ -f "/Users/fabio/.config/lean-ctx/shell-hook.zsh" ]; then
. "/Users/fabio/.config/lean-ctx/shell-hook.zsh"
fi
# lean-ctx shell hook — end

# >>> lean-ctx agent aliases >>>
alias claude='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" claude'
alias codebuddy='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codebuddy'
alias codex='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codex'
alias gemini='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" gemini'
# <<< lean-ctx agent aliases <<<

# >>> lean-ctx proxy env >>>
# ANTHROPIC_BASE_URL omitted: Claude Pro/Max subscription authenticates against api.anthropic.com directly (set ANTHROPIC_API_KEY to route Claude through the proxy)
export OPENAI_BASE_URL="http://127.0.0.1:4444/v1"
export GEMINI_API_BASE_URL="http://127.0.0.1:4444"
# Grok proxy env omitted: run `grok login` (subscription) or set XAI_API_KEY to route Grok through lean-ctx
# Command Code omitted (no ~/.commandcode auth — run `cmd login` or set COMMAND_CODE_API_KEY)
# <<< lean-ctx proxy env <<<
