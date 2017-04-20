#!/bin/bash
# create the $HOME/opt/bin directory if it doesn't exist
new_path_dir="$HOME/opt/bin"
mkdir -p $new_path_dir

# add it to the path if it's not already there
in_path=0
echo "$PATH" | grep -q "$new_path_dir" && in_path=1
if [ $in_path == 0 ]; then
    echo $'\n# this line was added by touchtog and adds its location to the path' >> ~/.bashrc    
    echo "export PATH=\"\$PATH:$new_path_dir\"" >> ~/.bashrc
    source $HOME/.bashrc
fi

# copy the bash script to that directory
cp touchtog "$new_path_dir"

# get the current list of key bindings
binding_list=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
was_none=0
if [ "$(echo $binding_list)" == '@as []' ]; then
    was_none=1    
    binding_list="['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
fi

# strip off the brackets from the list
binding_list="${binding_list:1:-1}"

# get the length of the list
comma=","
if [ $was_none == 1 ]; then
    list_length="0"
else    
    list_length=$(grep -o "$comma" <<< "$binding_list" | wc -l)
fi

if [ $was_none == 0 ]; then
    list_length=$(($list_length+1))
fi

# create the new item
new_item=${binding_list%,*}
new_item=$(echo $new_item | sed s/0/$list_length/1)

# add the new item to the list
if [ $was_none == 1 ]; then
    binding_list="$new_item"
else    
    binding_list="$binding_list, $new_item"
fi

# set the new list as the gsettings (adding the key binding
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[$binding_list]"

# set the properties of the new key binding
set_arg="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${new_item:1:-1}"
gsettings set "$set_arg" name 'toggle touchpad'
gsettings set "$set_arg" command "'$new_path_dir/touchtog'"
gsettings set "$set_arg" binding '<Control><Shift>J'

# output messages
echo "Done. You can now start using touchtog"
echo "To toggle your touchpad on/off, press Ctrl+Shift+J"
echo "You can change the hotkey in your system settings via your O.S. GUI."
echo "System Settings > Keyboard > Shortcuts > Custom Shortcuts"
echo "Alternatively, you can type the command 'touchtog' after terminal restart"

# unset all the variables used in this script
unset binding_list; unset comma; unset list_length; unset new_item;
unset was_none; unset set_arg; unset in_path; unset new_path_dir;
