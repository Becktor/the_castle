# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#set caps to ctrl
setxkbmap -option ctrl:swapcaps
setxkbmap -model pc104 -layout us,dk  -option grp:shifts_toggle

#disable touch
#xinput disable 9


#Screen res
xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode eDP-1 1920x1080
xrandr --output eDP-1 --mode 1920x1080 &

#Backgroun
feh --bg-center /home/jobe/Desktop/drump.png

#Emacs
sudo emacs --daemon

#Network manager
nm-applet &

#conky
conky &

#xscreensaver
xscreensaver -no-splash &
#i3
exec i3
