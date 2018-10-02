# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/projects"

# Laravel
alias pa="php artisan"
alias mw="yarn run watch"
alias md="yarn run dev"
alias mp="yarn run prod"

# Composer
unalias cgr

function devl() {
  dev && cd laravel/$1
}

function devp() {
  dev && cd packages/$1
}

function devw() {
  dev && cd wordpress/$1
}

function devn() {
  dev && cd node/$1
}

alias nvidia_update='bash <(curl -s https://raw.githubusercontent.com/Benjamin-Dobell/nvidia-update/master/nvidia-update.sh)'

function composer-link() {  
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

