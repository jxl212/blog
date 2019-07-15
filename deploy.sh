#!/bin/bash

COLOR_START='\033[0;32m'
COLOR_START_2='\033[0;31m'
COLOR_END='\033[0m'

msg="Deploying updates to GitHub..."
echo -e "${COLOR_START}$msg${COLOR_END}"


# Build the project.
hugo -t cayman-hugo-theme # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..


msg="done"
echo -e "${COLOR_START}$msg${COLOR_END}"
