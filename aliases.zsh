# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/projects"

# Laravel
alias pa="php artisan"
alias yw="yarn run watch"
alias yd="yarn run dev"
alias yp="yarn run prod"

# Composer
unalias cgr

function devgo() {
  cd $GOPATH/src/$1
}

function composer-link() {  
    composer config repositories.${2:-local} path "$1"
}

alias dyn="dynamodb-local -port 1337"
alias awsdyn="aws --endpoint http://localhost:1337 dynamodb"

function ssh-tunnel() {
  echo "Opening tunnel on localhost:1080"
  ssh -ND 1080 $1
}

function vnc-tunnel() {
  echo "Opening vnc tunnel on localhost:5900"
  ssh -t -L 5900:$2:5900 -N $1
}