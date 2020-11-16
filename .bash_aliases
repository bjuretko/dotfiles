# Docker
alias dm="docker-machine"
alias dc="docker-compose"
alias dcdown="docker-compose down --rmi all -v"
alias dcup="docker-compose up"
alias dstop="docker ps -q | xargs -I {} docker stop {}"
alias dclogs="docker-compose logs"
alias dockly="docker run -it -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly"

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dns="dig +nocmd any +multiline +noall +answer"


# Filesystem
alias ll="ls -lahGp"

# Azure
alias az_vnet_list_subnets="az network vnet list --output tsv --query '[].{subnet:subnets[].addressPrefix[]|[0], name:name}'"
alias az_vm_list="az vm list -d"


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

# execute a command on all running docker machines
execdmall() {
  docker-machine ls -q --filter "state=Running" | xargs -I {} docker-machine ssh {} $1
}

checkssl() {
  openssl s_client -showcerts -connect $1:443
}
