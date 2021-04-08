# Docker
alias dm="docker-machine"
alias dc="docker-compose"
alias dcdown="docker-compose down --rmi all -v"
alias dcup="docker-compose up"
alias dstop="docker ps -q | xargs -I {} docker stop {}"
alias dclogs="docker-compose logs"
alias dockly="docker run -it -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly"

# Network
alias ip="dig myip.opendns.com A myip.opendns.com AAAA +short @resolver1.opendns.com"
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
  echo $(security find-generic-password -s $1 -g 2>&1 | grep "acct" | cut -d \" -f 4)
}

getkeychainpassword() {
  echo $(security find-generic-password -s $1 -g 2>&1 | grep "password" | cut -d \" -f 2)
}



checkssl() {
  openssl s_client -showcerts -connect $1:443
}
