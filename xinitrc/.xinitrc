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

exec xmonad
