# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# use bash -l in shell to reload changes made in this file



# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # DEBUG="1"

  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    [ "$DEBUG" ] && echo "sourcing .bashrc..."
    . "$HOME/.bashrc"
  fi

  # Alias definitions.
  # You may want to put all your additions into a separate file like
  # ~/.bash_aliases, instead of adding them here directly.
  # See /usr/share/doc/bash-doc/examples in the bash-doc package.
  if [ -f ~/.bash_aliases ]; then
    [ "$DEBUG" ] && echo "sourcing .bash_aliases..."
    . ~/.bash_aliases
  fi

  # https://github.com/magicmonty/bash-git-prompt
  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    [ "$DEBUG" ] && echo "sourcing git-prompt..."
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi

  # brew install bash-completion@2 for bash4
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    [ "$DEBUG" ] && echo "sourcing /usr/local/share/bash-completion/bash_completion..."
    . /usr/local/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    [ "$DEBUG" ] && echo "sourcing  /etc/bash_completion..."
    source /etc/bash_completion;
  fi

fi

export GPG_TTY=$(tty)


## HSTR

# append to the history file, don't overwrite it
shopt -s histappend

#export HSTR_CONFIG=raw-history-view
#export HSTR_CONFIG=favorites-view
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hh -k \C-j"'; fi


update_terminal_cwd() {
	return
}
