#!/bin/sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Colors
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

read -p "Press ${BLUE}any${RESET} key to start the install process: "

echo "${BLUE}Staring install process...${RESET}"


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# System Changes
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "${RED}Disabling${RESET} GateKeeper"
sudo spctl --master-disable
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO 

echo "${RED}Disabling${RESET} dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock 

echo "${GREEN}Adding${RESET} blank space to dock"
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

echo "${BLUE}Setting${RESET} key repeat and key delay to be faster (${RED}reboot required${RESET})"
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

echo "${BLUE}Configuring${RESET} dock to autohide"
osascript <<EOD
  tell application "System Events"
    if (get autohide of dock preferences) is false then
      tell dock preferences to set autohide to not autohide
    end if
  end tell
EOD

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Development Tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo "${GREEN}Installing${RESET} Xcode Command Line tools"
xcode-select --install

read -p "Press ${BLUE}any${RESET} key once the Xcode Command Line tools are done installing..."

echo "${GREEN}Installing${RESET} oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "${GREEN}Installing${RESET} Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



brew_packages=(
	"git"
	"thefuck"
	"zsh-autosuggestions"
	"zsh-syntax-highlighting"
	"zsh-autosuggestions"
	"node"
	"mas"
	"python3"
)

echo "${GREEN}Installing${RESET} Homebrew packages"

for package in "${brew_packages[@]}"; do
	brew install "$package"
done

brew_cask_applications=(
	"sublime-text"
	"1password"
	"iina"
	"cheatsheet"
	"backblaze"
	"istat-menus"
	"bartender"
	"tower"
	"sketch"
	"docker"
)

echo "${GREEN}Installing${RESET} Homebrew Cask Applications"

for cask_package in "${brew_cask_applications[@]}"; do
  brew cask install "$cask_package"
done

mas_applications=(
	"924726344" # Delieveries
	"497799835" #Xcode
	"409201541" #Pages
	"409203825" #Numbers
	"409183694" #Keynote

)

for mas_app in "${mas_applications[@]}"; do
  mas install "$mas_app"
done

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Dotfiles
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


read -p "Press ${BLUE}any${RESET} key once you've setup iCloud Documents..."

open Personal.terminal
defaults write com.apple.Terminal "Default Window Settings" -string 'Personal'
defaults write com.apple.Terminal "Startup Window Settings" -string 'Personal'


killall Dock


rm ~/.zshrc

ln -s /Users/john/Documents/Programming/Personal/dotfiles/zsh/.zshrc ~/.zshrc  
ln -s /Users/john/Documents/Programming/Personal/dotfiles/git/gitconfig ~/.gitconfig  
ln -s /Users/john/Documents/Programming/Personal/dotfiles/git/gitignore_global ~/.gitignore_global
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/Documents/Programming/Personal/dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime



echo "🍻🍻🍻🍻🍻Finished! Enjoy! 🍻🍻🍻🍻🍻"

	

