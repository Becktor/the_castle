#!/bin/zsh

# Dependencies:
# - acpi
#
# @return {Number(%)}: Current battery charge
################################


full=""
short=""
color=""
label=""

# Exit if no battery was found
if [[ "$(acpi)" == "" ]]; then exit 0; fi


state=$(acpi | sed -n 's/Battery [0-9]: \([A-Z]\).*, .*/\1/p')
chg=$(acpi | sed -n 's/Battery [0-9]:.*, \([0-9]\{1,3\}\)%.*/\1/p')


# Charging or Unknown
if [[ $state == "C" ]] || [[ $state == "U" ]]; then
    icon="Charging"
else
    if [ $chg -le 10 ]; then
        color='\033[31m'
        label=""
       	icon="⚡"
    else
        label=''
        color='\033[32m'
	icon="⚡"
    fi
fi

full="$color $icon $chg%"
short="$chg%"

echo -e $full
