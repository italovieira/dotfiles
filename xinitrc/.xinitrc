xrdb -I$HOME ~/.Xresources

# Disable PC speaker beep
# https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#In_X
xset -b

# Remap Caps Lock to Control
# https://www.emacswiki.org/emacs/MovingTheCtrlKey
# https://wiki.archlinux.org/index.php?title=Keyboard_configuration_in_Xorg&oldid=524623#Swapping_Caps_Lock_with_Left_Control
setxkbmap -option ctrl:nocaps

# https://unix.stackexchange.com/questions/265503/how-do-i-fix-no-such-secret-collection-at-path-for-gnome-keyring-and-arch-l/514033
# https://bugs.archlinux.org/task/46374
# https://gitlab.gnome.org/GNOME/fractal/issues/198#note_103026
# needed only if not started with pam (/etc/pam.d/login) https://wiki.archlinux.org/index.php?title=GNOME/Keyring&oldid=576776#PAM_method
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

redshift &

# https://wiki.archlinux.org/index.php?title=Xbindkeys&oldid=547431#Making_changes_permanent
xbindkeys

exec xmonad
