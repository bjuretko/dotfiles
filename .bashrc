export LC_ALL=C
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
#export HSTR_CONFIG=raw-history-view
#export HSTR_CONFIG=favorites-view

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
