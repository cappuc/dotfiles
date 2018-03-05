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

#Vessel
alias vs='./vessel'

#Docker
alias dneo4j='docker run --rm -p 7687:7687 -p 7474:7474 -e 'NEO4J_AUTH=none' neo4j:latest'
