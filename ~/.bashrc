# shellcheck disable=SC2148,SC1091,SC2155
# ~/.bashrc

# .bashrc is executed on every new interactive shell
# see .profile for definitions for login shells only
# NOTE THAT ON OSX .bash_profile IS USED INSTEAD OF .bashrc
# this .bashrc file is sourced from there

[ "$DEBUG" ] && echo . "$HOME/.bashrc"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GPG_TTY="$(tty)"

## HSTR

# append to the history file, don't overwrite it
shopt -s histappend

#export HSTR_CONFIG=raw-history-view
#export HSTR_CONFIG=favorites-view
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HSTR_CONFIG=hicolor       # get more colors
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hh -k \C-j"'; fi

# set our prompt
[ "$DEBUG" ] && echo "  land starship..."
eval "$(starship init bash)"

## Python env
## see https://docs.brew.sh/Homebrew-and-Python
[ "$DEBUG" ] && echo "  pyenv init..."
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_ENV_HINTS=1