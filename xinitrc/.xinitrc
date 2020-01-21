xrdb -I$HOME ~/.Xresources

# Disable PC speaker beep
# https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#In_X
xset -b

# Remap Caps Lock to Control
# https://www.emacswiki.org/emacs/MovingTheCtrlKey
# https://wiki.archlinux.org/index.php?title=Keyboard_configuration_in_Xorg&oldid=524623#Swapping_Caps_Lock_with_Left_Control
setxkbmap -option ctrl:nocaps

redshift &

# https://wiki.archlinux.org/index.php?title=Xbindkeys&oldid=547431#Making_changes_permanent
xbindkeys

LOCKER="i3lock -n -i $(grep -o "'.*'" $HOME/.fehbg | tr -d \')"

# For start dunst
# https://wiki.archlinux.org/index.php?title=Dunst&oldid=594925#Dunst_fails_to_start_via_systemd
# https://github.com/dunst-project/dunst/issues/457#issuecomment-369606356
systemctl --user import-environment DISPLAY

# Autostart
xautolock -time 1 -corners 000- -locker "$LOCKER" &
xss-lock -- $LOCKER &

exec xmonad
