# shellcheck disable=SC2148,SC1091
# ~/.bash_aliases

# Alias defintions and helper functions for bash5

[ "$DEBUG" ] && echo . "$HOME/.bash_aliases"

alias e=exit

# Docker aliases

alias docker="podman"

alias dc="docker compose"
alias dcdown="docker compose down --rmi all -v"
alias dcup="docker compose up"
alias dstop="docker ps -q | xargs -I {} docker stop {}"
alias dclogs="docker compose logs"

# Network
alias ip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"

dns() { 
  dig +nocmd any +multiline +noall +answer $1 
}

alias httpd="python3 -m http.server"

port() { 
  lsof -i ":$1" 
}

# MacOS stuff

# number of open files
alias nof="lsof | awk '{print $1}' | sort | uniq -c | sort -rn | head"
# top process consuming nofs
alias tof="ps -p $(lsof  |  awk '{print $2}' | sort | uniq -c | sort -rn | head -n 1 | awk '{print $2}') -o comm="
# increas nofs
alias doublemaxfiles="(sysctl -w kern.maxfiles=150000; sysctl -w kern.maxfilesperproc=100000)"


alias runningrosettas="ps -p \$(fuser /usr/libexec/rosetta/runtime | sed -e 's/.*: //' | sed -e 's/ /,/g')"
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
