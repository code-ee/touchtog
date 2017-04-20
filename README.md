## touchtog
This bash script finds the current enabled state of a touchpad or
trackpad on a linux device and then switches that state to the
opposite state. NOTICE: You MAY have to change the case of the word
"Touchpad" to "TouchPad" in the touchtog bash file. Personally, I had
two touchpad devices (one synaptics, the other the physical device)
and they had different cases, the physical one is what worked for me)
To install this script, simply run the install.sh via command line:

1. Navigate to the cloned repository if not already there:

    cd /path/to/touchtog

1. Run the install script:

    ./install.sh

After doing so, you'll have the hotkey Ctrl+Shift+J to toggle your
touchpad on and off. You'll also be able to do it via command line
by typing the command 'touchtog' (after restarting your terminal).
