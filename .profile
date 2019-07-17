# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# use bash -l in shell to reload changes made in this file


# set PATH so it includes user's private bin directories

# Python
export PATH=$PATH:~/Library/Python/2.7/bin

# Go
export GOPATH=$HOME/.go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Miniconda3
export PATH="/Users/benedict/miniconda3/bin:$PATH"

# local binaries
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"


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
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

export GPG_TTY=$(tty)

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


## Bash-Completions

# https://github.com/magicmonty/bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

if type brew 2&>/dev/null; then
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi

# brew install bash-completion@2 for bash4
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi

# source additional bash completions
# git completion https://github.com/git/git/blob/master/contrib/completion/
# https://docs.docker.com/docker-for-mac/#install-shell-completion
if ! shopt -oq posix; then
  # comes with bash-completion [ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
  [ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ] && . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  [ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ] && . /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
  [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ] && . /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

## Python env
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pipenv --completion)"

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
