# touchtog

### Program Description
This bash script finds the current enabled state of a touchpad or
trackpad on a linux device and then switches that state to the
opposite state.

NOTICE: You MAY have to change the case of the word "Touchpad" to
"TouchPad" in the touchtog bash file depending on your system.
Personally, I had two touchpad devices (one synaptics, the other the
physical device) and they had different cases, the physical one is
what worked for me).


### Installation
To install this script, simply run the install.sh via command line:

1. Navigate to the cloned repository if not already there:

    `cd /path/to/touchtog`

1. Run the install script:

    `./install.sh`

### Using touchtog
After installing, you can use either of the following methods to toggle your touchpad.

1. Using the keyboard shortcut *(Gnome based distributions only)*

    `Ctrl + Shift + J`

1. Via the command line

    `touchtog`
