# pedal2rudder

"pedal2rudder" is a little lua script which can be used together with the "FlyWithLua" plugin in the X-Plane flight simulator. The script can map the 2 pedals "clutch" and "brake" or "accelerator" of a racing pedal set into one "yaw" or "rudder" axis.

If you're flying mostly helicopters ( like me ) you might want to engage the parking brake permanently so that the heli does not slide on the ground if the brake is released. To do so, set the variable "use_brakes = 0" in the script.

The update frequency pretty much depends on your FPS (Frames Per Second) rate, but even with 30 updates per second the steering is pretty direct. A negative impact by the script on the FPS was not measurable.

Customize the script to your needs. I.e. comment out the notifiction "voice" if you want.


# Installation

Simply copy the script to the "X-Plane 11/Resources/plugins/FlyWithLua/Scripts" folder. Then map the "clutch" pedal as "left toe brake" and the "accelerator" pedal as "right toe brake". It does not matter wether the axis is set to "reverse" or not. The script will then map them to the rudder or tail-rotor axis.


# Uninstall

Just delete the script from the "X-Plane 11/Resources/plugins/FlyWithLua/Scripts" folder and reload/restart FlyWithLua.


