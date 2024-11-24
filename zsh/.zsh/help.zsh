autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help
