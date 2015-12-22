#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
# End of /etc/skel/.bash_profile

# Autostart X at login
# See https://wiki.archlinux.org/index.php/Xinitrc#Autostart_X_at_login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
