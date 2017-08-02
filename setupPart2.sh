#!/bin/sh

ln -s /Users/john/Documents/Code/Personal/dotfiles/zsh/.zshrc ~/.zshrc  
ln -s /Users/john/Documents/Code/Personal/dotfiles/git/gitconfig ~/.gitconfig  
ln -s /Users/john/Documents/Code/Personal/dotfiles/git/gitignore_global ~/.gitignore_global
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/Documents/Code/Personal/dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime



