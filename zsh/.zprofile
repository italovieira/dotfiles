# Autostart X at login
# https://wiki.archlinux.org/index.php/Xinitrc#Autostart_X_at_login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
