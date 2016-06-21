# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap -option ctrl:nocaps
setxkbmap -model pc104 -layout dk,us  -option grp:alt_shift_toggle
xinput disable 9
sudo rfkill unblock wlan
exec i3
