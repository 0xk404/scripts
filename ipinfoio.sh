#!/bin/bash
ipinfotoken=ipinfotoken
red="\e[0;91m"
bold="\e[1m"
reset="\e[0m"
if [ "$1" = "" ]
then
	iploc=$(curl -s ipinfo.io/?token="$ipinfotoken")
	ip=$(echo $iploc | jq -r .ip)
	echo -e "${red}${bold} NoIip!\n Getting external ip ... [$ip] \n Ipinfo.io results:${reset}"
	printf "$iploc\n"  | jq .
else
	theip="$1"
	echo -e "${red}${bold} Ip [$theip] \n Ipinfo.io results:${reset}"
	iploc=$(curl -s ipinfo.io/"$theip"?token="$ipinfotoken")
	printf "$iploc\n" | jq .
fi
echo -e "${red}${bold} Map:${reset}"

location=$(echo $iploc | jq -r .loc)
echo '{"bing": "https://duckduckgo.com/?q='$location'&t=ffab&ia=web&iaxm=maps","google": "http://maps.google.com/maps?q='$location'"}' | jq .
