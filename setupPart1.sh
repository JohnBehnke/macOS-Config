#!/bin/sh

echo 
read -p "Are you ready to download a bunch of sweet development tools? <y/n> " prompt

if [[ $prompt =~ [yY](es)* ]]
then
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

	

	brew install gcc

	brew install zsh-syntax-highlighting
	brew install npm
	brew install koekeishiya/kwm/kwm   

	#don't re-enable gatekeeper
	sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO 

	echo "Making a temporary folder on the desktop to hold downloads"
	dir="/Users/$USER/Desktop/Development Downloads"

	mkdir "$dir"

	cd "$dir"

	#Downloads

	urls=('https://download.sublimetext.com/Sublime%20Text%20Build%203103.dmg'
		'https://d38qbqfndhlqd2.cloudfront.net/Flux34-3.zip'
		'http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/031-03190.20140529.Pp3r4/JavaForOSX2014-001.dmg'
		'https://cloud.delosent.com/ublock-safari-0.9.5.0.safariextz'
		
		
		
		)

	#string to hold the curl command
	masterURL=""
	open="-O "
	space=" "

	#combines all of the urls into a single string to pass as a curl argument
	for (( i = 0; i < ${#urls[@]}; i++ )); do
		
		masterURL=$masterURL$space$open${urls[i]}

	done
	echo "Downloading Development Tools..."

	#download errrrrything
	curl $masterURL

	echo "Finished!!!"

	
		defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

	defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock #remove dashboard, change to NO if you want it back
	

	
	killall Dock

	
	echo "🍻🍻🍻🍻🍻Finished! Enjoy! 🍻🍻🍻🍻🍻"
	sleep 3.0
	

else
	echo "Well..... nevermind then :("
		sleep 2.0
	exit
fi

