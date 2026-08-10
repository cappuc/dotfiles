# History file and size
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt extended_history        # record timestamp + duration (enables `history -i`)
setopt hist_expire_dups_first  # trim duplicates first when the history fills up
setopt hist_ignore_dups        # don't record a command repeated back-to-back
setopt hist_ignore_space       # a leading space keeps a command out of history
setopt hist_verify             # confirm !! / !foo expansions before running
setopt inc_append_history      # write as commands run, not at shell exit
setopt share_history           # live history shared across open terminals
