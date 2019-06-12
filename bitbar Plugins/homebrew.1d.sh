#!/bin/bash

#I've taken the next six lines from the brew update plugin.
exit_with_error() {
  echo "err | color=red";
  exit 1;
}

/usr/local/bin/brew update &> /dev/null || exit_with_error; 


OUTDATED=$(/usr/local/bin/brew outdated --quiet);
UPDATES=$(comm -13 <(for X in "${PINNED[@]}"; do echo "${X}"; done) <(for X in "${OUTDATED[@]}"; do echo "${X}"; done))
UPDATE_COUNT=$(echo "$UPDATES" | grep -c '[^[:space:]]');



CASK_OUTDATED=$(/usr/local/bin/brew cask outdated --quiet);
CASK_UPDATES=$(comm -13 <(for X in "${CASK_PINNED[@]}"; do echo "${X}"; done) <(for X in "${CASK_OUTDATED[@]}"; do echo "${X}"; done))
CASK_UPDATE_COUNT=$(echo "$CASK_UPDATES" | grep -c '[^[:space:]]');


echo "🍺 $UPDATE_COUNT,$CASK_UPDATE_COUNT"
echo "---"

if [[ "${CASK_UPDATE_COUNT}" != "0" ]]; then
  echo Cask
  echo "$CASK_UPDATES" | awk '{print "-- " $0 " | terminal=true refresh=true bash=/usr/local/bin/brew param1=cask param2=upgrade param3=" $1}'
  echo "-- ---"
  echo "-- Upgrade all | bash=/usr/local/bin/brew param1=cask param2=upgrade terminal=true refresh=true"
fi

echo Default
if [ -n "$UPDATES" ]; then
  echo "$UPDATES" | awk '{print "-- " $0 " | terminal=true refresh=true bash=/usr/local/bin/brew param1=upgrade param2=" $1}'
  echo "-- ---"
  echo "-- Upgrade all | bash=/usr/local/bin/brew param1=upgrade terminal=true refresh=true"
fi

echo "---"
echo "Brew Update | bash=brew param1=update terminal=true refresh="
echo "Brew Upgrade | bash=brew param1=upgrade terminal=true refresh="
echo "Brew Cleanup | bash=brew param1=cleanup terminal=true refresh="
echo "Brew Cask Cleanup | bash=brew param1=cask param2=cleanup terminal=true refresh="
echo "Refresh | refresh="
