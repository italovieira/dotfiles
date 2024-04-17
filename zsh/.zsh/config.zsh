HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

ZLE_SPACE_SUFFIX_CHARS=$'&|'

# https://unix.stackexchange.com/a/453339.
TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'
