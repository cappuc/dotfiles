# macOS /etc/zprofile (path_helper) reorders PATH after .zshenv in login shells.
source $HOME/.zshenv

# Directory navigation
setopt auto_cd auto_pushd pushd_ignore_dups

# Completion (compinit itself runs at the end, after fpath is complete)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Up/Down walk only the history entries starting with what's already typed.
# Both escape sequences are bound: ^[[A is the normal one, ^[OA is what some
# terminals send in application mode.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Load interactive dotfiles config.
source $DOTFILES/history.zsh
source $DOTFILES/aliases.zsh

# Personal aliases live in $DOTFILES/aliases.zsh (sourced above).
# For a full list of active aliases, run `alias`.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=it_IT.UTF-8
export LANG=it_IT.UTF-8

# Fallback to xterm-256 for ssh connections
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# starship
eval "$(starship init zsh)"

# Java/Android
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
# export JAVA_HOME="/Users/fabio/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
# export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk | tail -n 1)"
# export NDK_HOST_TAG="darwin-x86_64"
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin

# rust
# export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export DYLD_FALLBACK_LIBRARY_PATH="$(xcode-select --print-path)/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
export LDFLAGS=-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
# export GSTREAMER_ROOT_ANDROID=/Users/fabio/projects/lib/gstreamer-1.0-android-universal-1.26.1
# export GSTREAMER_ROOT_WINDOWS=/Users/fabio/projects/lib/gstreamer-1.0-devel-msvc-x86_64-1.26.1
# export GSTREAMER_ROOT_WINDOWS=/Volumes/T7B/dev/lib/gstreamer-1.0-devel-msvc-x86_64-1.26.1

# gstreamer
# export GST_PLUGIN_PATH="/opt/homebrew/opt/aravis/lib/gstreamer-1.0:${GST_PLUGIN_PATH}"

# bun completions
[ -s "/Users/fabio/.bun/_bun" ] && source "/Users/fabio/.bun/_bun"

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

# Trust the Laravel Valet root CA in Node (fetch/https against *.test)
export NODE_EXTRA_CA_CERTS="$HOME/.config/valet/CA/LaravelValetCASelfSigned.pem"
