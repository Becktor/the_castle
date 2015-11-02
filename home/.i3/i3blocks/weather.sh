#!/usr/bin/env bash

################################
# Shows info about the weather (in Cincinnati) from accuweather.com
#
# TODO: completely rewrite, probably using openweather APIs
# TODO: make location configurable
# TODO: make temperature unit configurable
#
# @return {Number(degrees Fahrenheit)}: Current temperature in Cincinnati
################################

dir=$(dirname $0)
source $dir/util.sh

full=""
short=""
color=""
status=0


URL='http://www.accuweather.com/en/jp/tokyo/226396/weather-forecast/226396'
SITE="$(curl -s "$URL")"

weather="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 }'| head -1)"
temp="$(echo "$SITE" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°" }'| head -1)"


if [[ $weather == *thunder* || $weather == *Thunder* ]]; then
    color="#4F8AFF\n"
    icon=""
else
    if [[ $weather == *rain* || $weather == *Rain* ]]; then
        color="#4F8AFF\n"
        icon=""
    else
        if [[ $weather == *cloud* || $weather == *Cloud* ]]; then
            color="#C0C0C0\n"
            icon=""
        else
            color="#FFDA2F\n"
            icon=""
        fi
    fi
fi


full="$icon $temp"
short="$temp"


echo $full
echo $short
echo $color
exit $status
