# .bashrc is executed on every new interactive shell
# see .profile for definitions for login shells only

# NOTE THAT ON OSX .bash_profile IS USED INSTEAD OF .bashrc

echo $HOME/.bashrc

# set our prompt
eval "$(starship init bash)"