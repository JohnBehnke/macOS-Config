#!/bin/sh

echo "Disable GateKeeper. I'm assuming that you know how to NOT download a virus"

sudo spctl --master-disable

echo "Installing Xcode Command Line tools"
xcode-select --install
echo  "I'm gonna sleep for a bit (20 seconds) to make sure you have the development tools! 💤"
sleep 20.0

#echo "Automagically agree to the Xcode Agreement. This might sell your soul to Tim Cook."
#sudo xcodebuild -license

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
brew install fortune
brew install thefuck
brew install rtv
brew install htop
brew install terminal-notifier

npm install --global pure-prompt



brew cask install sublime-text
brew cask install iterm2

#don't re-enable gatekeeper
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO 

defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock #remove dashboard, change to NO if you want it back

killall Dock


echo "🍻🍻🍻🍻🍻Finished! Enjoy! 🍻🍻🍻🍻🍻"
sleep 3.0
	

