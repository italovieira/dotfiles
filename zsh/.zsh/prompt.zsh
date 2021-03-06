# Customize prompt
# https://wiki.archlinux.org/index.php/Zsh#Customizing_the_prompt
# http://www.nparikh.org/unix/prompt.php
# https://wiki.archlinux.org/index.php/Git#Git_prompt
# https://git-scm.com/book/tr/v2/Git-in-Other-Environments-Git-in-Zsh
autoload -U colors && colors

PROMPT="[%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg_no_bold[yellow]%}%~%{$reset_color%}]%# "

FILE='/usr/share/git/completion/git-prompt.sh'

if [ -f $FILE ]; then
  setopt prompt_subst
  source $FILE
  RPROMPT='$(__git_ps1 "(%s)")'
fi
