#!/bin/sh
rm ~/.zshrc
# rm ~/.gitconfig
# rm ~/.gitignore_global
ln -s /Users/john/Documents/Programming/Personal/dotfiles/zsh/.zshrc ~/.zshrc  
ln -s /Users/john/Documents/Programming/Personal/dotfiles/git/gitconfig ~/.gitconfig  
ln -s /Users/john/Documents/Programming/Personal/dotfiles/git/gitignore_global ~/.gitignore_global
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/Documents/Programming/Personal/dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm /usr/local/bin/sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime