#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Starting deployment process for shreeshjha.github.io...${NC}"

# Check if git is initialized
if [ ! -d .git ]; then
    echo -e "${BLUE}Initializing git repository...${NC}"
    git init
    git add .
    git commit -m "Initial commit"
fi

# Check if remote exists
if ! git remote | grep -q "origin"; then
    echo -e "${RED}No remote repository found.${NC}"
    echo "Please add your remote repository using:"
    echo "git remote add origin https://github.com/shreeshjha/shreeshjha.github.io.git"
    exit 1
fi

# Check for uncommitted changes
if [[ $(git status -s) ]]; then
    echo -e "${BLUE}Changes detected, committing...${NC}"
    git add .
    read -p "Enter commit message: " commit_message
    git commit -m "$commit_message"
fi

# Push to GitHub
echo -e "${BLUE}Pushing to GitHub...${NC}"
git push -u origin main

echo -e "${GREEN}✨ Deployment complete!${NC}"
echo -e "${BLUE}Your website should be live at https://shreeshjha.github.io in a few minutes.${NC}"
