#!/bin/sh

echo 
read -p "Are you ready to download a bunch of sweet development tools? <y/n> " prompt

if [[ $prompt =~ [yY](es)* ]]
then
	echo "Disable GateKeeper. I'm assuming that you know how to NOT download a virus"

	spctl --master-disable

	echo "Installing Xcode Command Line tools"
	xcode-select --install

	echo "Automagically agree to the Xcode Agreement. This probs sells your soul to Tim Cook."
	xcrun cc

	echo "Get brew, becuae brew is life"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	echo "Get zsh and make it the default shell, becuase bash is for old people"
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


	#Disabled Valgrind for now since its not super necessary
		# #next, get valgrind for some memory leak checking. Gets the head for the most current version
		# #since they take forever to update to the newest OSX version
		# brew install --HEAD valgrind
		# #install git because git is awesome
		# brew install git



	echo "Making a temporary folder on the desktop to hold downloads"
	dir="/Users/$USER/Desktop/Development Downloads"

	mkdir "$dir"

	cd "$dir"

	#Downloads

	urls=(http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg
		https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20194.zip
		https://d38qbqfndhlqd2.cloudfront.net/Flux34-3.zip
		https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%203.0.5.dmg 
		http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/031-03190.20140529.Pp3r4/JavaForOSX2014-001.dmg
		https://cloud.delosent.com/ublock-safari-0.9.5.0.safariextz
		https://dl.google.com/dl/android/studio/install/1.2.2.0/android-studio-ide-141.1980579-mac.dmg
		https://steamcdn-a.akamaihd.net/client/installer/steam.dmg
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

	echo "Adding blank spaces to dock"
	for ((i = 0; i < 4; i++)); do
		defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
	done
	killall Dock
	
	echo "Finished! Ejnoy🍻"
	sleep 3.0
	
	


else
	echo "Well..... nevermind then :("
		sleep 2.0
	exit
fi

