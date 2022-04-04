# shellcheck disable=SC2148,SC1091
# ~/.bash_profile

# Normally this file is sourced once per interactive login shell
# and .bashrc for subsequent interactive shells.
# Run DEBUG=1 bash -l to create a new login shell with debugging
# output to see sourcing behaviour

# export DEBUG=1
[ "$DEBUG" ] && echo "BASH_VERSION: $BASH_VERSION $SHELL"

# When a .bash_profile is existing, bash does not source .profile
# so we will take this here
[ "$DEBUG" ] && echo . "$HOME/.bash_profile"

# sourcing general profile
[ -r "$HOME/.profile" ] && . "$HOME/.profile"

# Normally this file is sourced once per interactive login shell
# and .bashrc for subsequent interactive shells. MacOS is not
# following this convention with every app and re-sources
# .bash_profile instead. We will therefore source .bashrc here
# to setup interactive login shells for MacOS.
[ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"
