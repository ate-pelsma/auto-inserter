#!/bin/sh

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3

/usr/bin/perl -i.bak -ne 'print unless(m/^. Please enter the commit message/..m/^#$/)' "$COMMIT_MSG_FILE"

# Ignore branches with specific names
if [ -z "$BRANCHES_TO_SKIP" ]; then

    BRANCHES_TO_SKIP=(master)

fi

# Get the name of the current branch
BRANCH_NAME=$(git symbolic-ref --short HEAD)
BRANCH_NAME="${BRANCH_NAME##*/}"

# If branch_name contains two '-', keep only up to the second '-'
if [[ $BRANCH_NAME == *-*-* ]]; then

    BRANCH_NAME="${BRANCH_NAME%-*}"

fi

# Check if current branch should be ignored
BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" $1)

# Add branch name to commit messages
if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then

    sed -i.bak -e "1s/^/[$BRANCH_NAME] /" $1

fi