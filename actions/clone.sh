#!/bin/bash
if [[ "$1" != "" ]]; then
	git clone git@github.com:$1
        good_clone=$?
        if [[ $good_clone -eq 0 ]]; then
		cd $1
		git config user.name $GITHUB_USERNAME
		git config user.email $GITHUB_EMAIL
		exit
	else
		printf "\nrepo '$1' does not exist\n\n"
	fi
fi
printf "Usage: $($SCRIPT_DIR/helpers/get-alias.sh $0) <repo-name>\n"