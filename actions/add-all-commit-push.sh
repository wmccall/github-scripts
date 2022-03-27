#!/bin/bash
if [[ "$1" != "" ]]; then
    branch_name="$(git rev-parse --abbrev-ref HEAD)"
    git add -A
    git commit -m "$1"
    push_message="$(git push 2>&1)"
    push_command_exit_code=$?
    if [[ $push_command_exit_code -ne 0 ]]; then
        if [[ $push_message == "fatal: The current branch $branch_name has no upstream branch."* ]]; then
            printf "$($SCRIPT_DIR/helpers/decorate-message.sh "Setting upstream and pushing to remote")\n"
            git push --set-upstream origin $branch_name
        else
            printf "$($SCRIPT_DIR/helpers/decorate-message.sh "GitHub Error")\n"
        fi
    fi
    printf "$($SCRIPT_DIR/helpers/decorate-message.sh "Pushed: $push_message")\n"
    exit
fi
printf "Usage: $($SCRIPT_DIR/helpers/get-alias.sh $0) <commit message>\n"