# shellcheck disable=SC2148,SC1091
# ~/.bash_aliases

# Alias defintions and helper functions for bash5

[ "$DEBUG" ] && echo . "$HOME/.bash_aliases"

# Docker aliases

#   alias docker="nerdctl"

alias dm="docker-machine"
alias dc="docker compose"
alias dcdown="docker compose down --rmi all -v"
alias dcup="docker compose up"
alias dstop="docker ps -q | xargs -I {} docker stop {}"
alias dclogs="docker compose logs"

# Network
alias ip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
alias dns="dig +nocmd any +multiline +noall +answer"

alias bat="pmset -g batt"

# Filesystem
alias ll="ls -lahGp"

# Try to get subdomains of a domain using certificate transparency database
subdomains() {
  curl -s -q "https://crt.sh/?q=%.$1&output=json" | jq -M -r '.[].name_value' | sort | uniq
}

# get generic password data from osx keychain

getkeychainuser() {
  security find-generic-password -s "$1" -g 2>&1 | grep "acct" | cut -d \" -f 4
}

getkeychainpassword() {
  security find-generic-password -s "$1" -g 2>&1 | grep "password" | cut -d \" -f 2
}

checkssl() {
  openssl s_client -showcerts -connect "$1:443"
}
