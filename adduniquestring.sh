#/bin/bash
# smacked together by k404
red="\e[31m"
green="\e[32m"
bold="\e[1m"
reset="\e[0m"
if [[ "$1" = "" || "$2" = "" ]]
then
  echo -e "${red}${bold}Add what string to what file?${reset}"
else
  # check if file exists
  if test -f "$2"
    then
      # check if string in file
      if [ ! -z $(grep "$1" "$2") ]
        then
          echo -e "${red}${bold}String already in file!${reset}"
        else
          echo "$1" >> "$2"
          echo -e "${green}${bold}Added new string!${reset}"
      fi
    else
      pwd=$(pwd)
      touch "$2"
      echo "$1" > "$2"
      echo -e "${green}${bold}Created file ($pwd/$2) and added new string!${reset}"
  fi
fi
