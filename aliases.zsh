# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias c="clear"
alias takeout="docker run --rm -v //var/run/docker.sock:/var/run/docker.sock --add-host=host.docker.internal:host-gateway -it tighten/takeout:latest"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/projects"
alias devgo='cd $GOPATH/src'

# Laravel
alias pa="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
# alias seed="php artisan db:seed"
# alias serve="php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
# alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"
# alias composer-fix="/Users/fabio/projects/other/composer/bin/composer"
# alias fixpcre2="ln -s /opt/homebrew/Cellar/pcre2/$(brew info --json pcre2 | jq '.[0].installed[0].version')/include/pcre2.h /opt/homebrew/Cellar/php/$(brew info --json php | jq '.[0].installed[0].version')/include/php/ext/pcre/pcre2.h"
function composer-link() {
    composer repo add ${2:-local} path "$1"
}

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# SSH
function ssh-tunnel() {
  echo "Opening tunnel on localhost:9090"
  ssh -N -D 9090 $1
}
function vnc-tunnel() {
  echo "Opening vnc tunnel on localhost:5900"
  ssh -t -L 5900:$2:5900 -N $1
}
