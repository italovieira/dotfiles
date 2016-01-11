# Customize prompt
# See https://wiki.archlinux.org/index.php/Zsh#Customizing_the_prompt
# See http://www.nparikh.org/unix/prompt.php
# See https://wiki.archlinux.org/index.php/Git#Git_prompt
# See https://git-scm.com/book/tr/v2/Git-in-Other-Environments-Git-in-Zsh
autoload -U colors && colors
setopt prompt_subst
source /usr/share/git/completion/git-prompt.sh
PROMPT="[%{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg_no_bold[yellow]%}%~%{$reset_color%}]%# "
RPROMPT='$(__git_ps1 "(%s)")'
