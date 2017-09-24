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

# Composer
unalias cgr

function devl() {
  dev && cd laravel/$1
}
