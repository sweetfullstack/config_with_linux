#!/usr/bin/env sh

# Terminate already running bar instances

#killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done


#echo "Bars launched..."
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

#polybar example &
MONITOR=eDP1 polybar bottom &
MONITOR=eDP1 polybar top &




echo "Bars launched..."
