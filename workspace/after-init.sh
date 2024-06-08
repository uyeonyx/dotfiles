#!/bin/zsh

read -p "Please enter your OPENAI_API_KEY: " OPENAI_API_KEY
echo "export ZSH_ASK_API_KEY=\"$OPENAI_API_KEY\"" >> ~/.zshrc
source ~/.zshrc
echo "ZSH_ASK_API_KEY has been added to your environment variables."

echo "Please login to GitHub"
gh auth login

rm -rf ~/workspace/after-init.sh
