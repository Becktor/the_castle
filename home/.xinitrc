# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#set caps to ctrl
setxkbmap -option ctrl:nocaps
setxkbmap -model pc104 -layout us,dk  -option grp:shifts_toggle

#disable touch
xinput disable 9

#Disable hwlock on wifi

sudo rfkill unblock wlan

#Screen res
xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode eDP-1 1920x1080
xrandr --output eDP-1 --mode 1920x1080

#Network manager
nm-applet &
sudo emacs --daemon
exec i3
