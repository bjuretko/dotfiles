#!/usr/local/bin/bash -l

# <bitbar.title>Docker Machine</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>Benedict Juretko</bitbar.author>
# <bitbar.author.github>Juretko</bitbar.author.github>
# <bitbar.desc>List docker-machines</bitbar.desc>
# <bitbar.image></bitbar.image>


#I've taken the next six lines from the brew update plugin.
exit_with_error() {
  echo "err | color=red";
  exit 1;
}

DMS=$(/usr/local/bin/docker-machine ls --format '{{.Name}}#{{.State}}' 2>/dev/null)

DMS_OK=$(echo $DMS | tr "[:space:]" "\n" | grep -w Running)
DMS_FAIL=$(echo $DMS | tr "[:space:]" "\n" | grep -w -E 'Timeout|Paused|Saved|Stopped|Stopping|Starting|Error')


NO_OK="no"
[ "$DMS_OK" != "" ] && NO_OK=$(echo $DMS_OK | tr "[:space:]" "\n" | wc -l | xargs)

NO_FAIL="no"
[ "$DMS_FAIL" != "" ] && NO_FAIL=$(echo $DMS_FAIL | tr "[:space:]" "\n" | wc -l | xargs) 

if [ "$NO_OK" != "no" -a "$NO_FAIL" == "no" ]; then 
	echo "🐟"
else
	echo "🐠 $NO_OK,$NO_FAIL"
fi

echo "---"
echo "$NO_OK machines running"
echo "$NO_FAIL machines offline"
echo "---"
echo $DMS_OK | tr "[:space:]" "\n" | tr "#" " echo " | xargs -I {} echo {} \| color=green terminal=true refresh=false bash=docker-machine param1=ssh param2={}

echo $DMS_FAIL | tr "[:space:]" "\n" | tr "#" " echo " | xargs -I {} echo {} \| color=red refresh=false

echo "---"
echo "APT Upgrade All machines | bash=~/bin/dm-dist-upgrade.sh terminal=true refresh="
echo "Refresh | refresh=true"
