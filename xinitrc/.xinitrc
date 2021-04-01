xrdb -I$HOME ~/.Xresources

# Disable PC speaker beep
# https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep#In_X
xset -b

# Remap Caps Lock to Control
# https://www.emacswiki.org/emacs/MovingTheCtrlKey
# https://wiki.archlinux.org/index.php?title=Keyboard_configuration_in_Xorg&oldid=524623#Swapping_Caps_Lock_with_Left_Control
setxkbmap -option ctrl:nocaps

# https://wiki.archlinux.org/index.php?title=Xbindkeys&oldid=547431#Making_changes_permanent
xbindkeys

LOCKER="i3lock -n -i $(grep -o "'.*'" $HOME/.fehbg | tr -d \')"

# For start dunst
# https://wiki.archlinux.org/index.php?title=Dunst&oldid=594925#Dunst_fails_to_start_via_systemd
# https://github.com/dunst-project/dunst/issues/457#issuecomment-369606356
systemctl --user import-environment DISPLAY

# Autostart
xautolock -time 7 -corners 000- -notify 10 -notifier "notify-send 'Locking in 10 seconds...'" -locker "$LOCKER" &
xss-lock -- $LOCKER &

# For start gnome-polkit agent
# https://bbs.archlinux.org/viewtopic.php?id=175895
# https://wiki.archlinux.org/index.php?title=Polkit&oldid=595960#Authentication_agents
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Solve problem when creating keyring in Seahorse
# https://bbs.archlinux.org/viewtopic.php?pid=1640822#p1640822
# https://wiki.archlinux.org/index.php?title=Systemd/User&oldid=623708#DISPLAY_and_XAUTHORITY
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# https://wiki.archlinux.org/index.php?title=GNOME/Keyring&oldid=651567#xinitrc_method
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec xmonad
