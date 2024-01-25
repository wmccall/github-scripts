# GitHub Scripts

A simple set of scripts to improve simple operations with github.

## Commands

`gclone`

* Clones a repo from GitHub

`pclone`

* Clones a remote repo from your _personal_ GitHub repos

`gcpall`

* Stages all files, commits them with a message, and pushes them to remote
* Will set upstream branch if remote push fails

## Install

* Clone the repository into your desired location
* Update your shell profile to contain the required env variables and aliases:

``` bash
# Git Scripts Config
export GITHUB_SCRIPTS_DIR="" # Uptate this to git-scripts install location, ex. "$HOME/github-scripts"
export PROFILE_LOCATION=""   # Update this to reference your shell profile location (this file), ex. "$HOME/.bashrc"
export GITHUB_USERNAME=""    # Update this to your github username
export GITHUB_NAME=""        # Update this to your github name
export GITHUB_EMAIL=""       # Update this to your github email

alias gcpall="$GITHUB_SCRIPTS_DIR/actions/add-all-commit-push.sh"
alias gclone="$GITHUB_SCRIPTS_DIR/actions/clone.sh"
alias pclone="$GITHUB_SCRIPTS_DIR/actions/personal-clone.sh"
```

* Source your shell profile
* Use the commands
