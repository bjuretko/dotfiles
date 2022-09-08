# shellcheck disable=SC2148,SC1091,SC2155
# ~/.profile

# executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# use bash -l in shell to reload changes made in this file

[ "$DEBUG" ] && echo . "$HOME/.profile"

#umask 022
export LC_ALL=C

# exten
eval "$(/opt/homebrew/bin/brew shellenv)"
# set PATH so it includes user's private bin directories

# Go
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# local binaries
export PATH="$HOME/.local/bin:/opt/homebrew/opt/curl/bin:$PATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# source BASH completions
# BASH-Completions@2

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    [ "$DEBUG" ] && echo ". ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [ "$DEBUG" ] && echo ". ${COMPLETION}"
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# the file "$HOME/.bash_completion" is sourced by bash completions above

# source Alias definitions.
[ -r "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"