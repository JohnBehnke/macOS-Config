#!/bin/sh

echo "Disable GateKeeper. I'm assuming that you know how to NOT download a virus"

sudo spctl --master-disable

echo "Installing Xcode Command Line tools"
xcode-select --install

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

sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO 

defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock #remove dashboard, change to NO if you want it back

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

killall Dock


rm ~/.zshrc
rm /usr/local/bin/sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

echo "🍻🍻🍻🍻🍻Finished! Enjoy! 🍻🍻🍻🍻🍻"
sleep 3.0
	

