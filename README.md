### Change network devices to standard names (to eth0, and wlan0)

inside `/etc/default/grub`

change
```
GRUB_CMDLINE_LINUX=""
```
to
```
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```
then run
```
sudo update-grub
sudo reboot
```

### Change notification service to dunst

edit /usr/share/dbus-1/services/org.freedesktop.Notifications.service
change executable to /usr/bin/dunst

### Change Sound Play Device (a.k.a Sink in Pulse Audio)

```
pacmd list-sinks # list availalbe sound cards
pacmd set-default-sink 4 # set card by id, already playing sound will not move
pacmd list-sink-inputs # list what sounds are played and to what sink they are directed
pacmd move-sink-input 9 4 # move played sound to another sink
```
