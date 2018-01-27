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






open Personal.terminal
defaults write com.apple.Terminal "Default Window Settings" -string 'Personal'
defaults write com.apple.Terminal "Startup Window Settings" -string 'Personal'



echo "Get brew, because brew is life"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Get zsh and make it the default shell, because bash is for old people"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


#install git because git is awesome
brew install git
brew install npm
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install cowsay
brew install thefuck


brew cask install sublime-text






killall Dock


rm ~/.zshrc
rm /usr/local/bin/sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

echo "🍻🍻🍻🍻🍻Finished! Enjoy! 🍻🍻🍻🍻🍻"

	

