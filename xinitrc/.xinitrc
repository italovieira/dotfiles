xrdb -I$HOME ~/.Xresources

# Disable PC speaker beep
# https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#In_X
xset -b

# Remap Caps Lock to Control
# https://www.emacswiki.org/emacs/MovingTheCtrlKey
setxkbmap -option ctrl:nocaps

exec i3
