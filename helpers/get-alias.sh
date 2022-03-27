#!/bin/bash
SAVEIFS=$IFS

IFS='/'
read -a strarr <<< "$1"

progName=""
for val in "${strarr[@]}";
do
  progName="$val"
done

aliasString=$(cat "$PROFILE_LOCATION" | grep "$progName")

IFS="="
read -a strarr <<< "$aliasString"
rawAlias=${strarr[0]}

IFS=" "
read -a strarr <<< "$rawAlias"
cleanAlias=${strarr[1]}

IFS=$SAVEIFS

echo $cleanAlias