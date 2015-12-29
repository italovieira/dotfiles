# Customize prompt
# See https://wiki.archlinux.org/index.php/Zsh#Customizing_the_prompt
# See http://www.nparikh.org/unix/prompt.php
autoload -U colors && colors
PROMPT="[%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg_no_bold[yellow]%}%~%{$reset_color%}]%# "

# aliases
alias ls='ls --color=auto'
