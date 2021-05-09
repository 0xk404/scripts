#/bin/bash
# smacked together by k404
if [[ "$1" = "" || "$2" = "" ]]
then
  echo "Add what string to what file?"
else
  # check if file exists
  if test -f "$2"
    then
      # check if string in file
      if [ ! -z $(grep "$1" "$2") ]
        then
          echo "Already in file!"
        else
          echo "$1" >> "$2"
          echo "Added new string!"
      fi
    else
      touch "$2"
      echo "$1" > "$2"
      echo "Created file and added new string!"
  fi
fi
