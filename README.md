# branch name auto-inserter
A simple Git hook to automatically add your branch name to your git commit messages.

## Description
Are you tired of constantly having to mention your Jira ticket number in your git commit messages?
This Git hook script will make your life easier by automatically inserting the name of your branch within brackets at the beginning of your commit message.
If you are working from a sub-branch, e.g. TEST-123-1, the script will remove the latter part, i.e. only TEST-123 will be added within brackets.
This is to make sure that the commit msg still mentions the correct Jira ticket.
If this is unwanted functionality, simply comment out those lines of code.

## How to install and run
Simply copy paste the contents of the prepare-commit-msg.sh file into your project's .git/hooks/prepare-commit-msg file and there you go, it works!
It should work in the command line as well as in IDEs such as IntelliJ (tested on v2023.2).

## Requirements
Make sure you have the relevant version of Git installed to your PC.

Do not forget to check that your branch name is the right one, as this whole script relies on that assumption.
Unfortunately, there is no way to completely subvert such silly human errors.

## Happy Coding!
