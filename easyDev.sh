#!/bin/sh




#Disable GateKeeper. I'm assuming that you know how to NOT download a virus
sudo spctl --master-disable
#First, get the xcode dev tools, which includes gcc and other swag
xcode-select --install

#agree to the Xcode Agreement. This probs sells your soul to Tim Cook. 
xcrun cc

#second, get brew, becuase that is the best ever of all time
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Get zsh... becuase bash is that prom shit
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#next, get valgrind for some memory leak checking. Gets the head for the most current version
#since they take forever to update to the newest OSX version
brew install --HEAD valgrind
#install git because git is awesome
brew install git

#Get the username
userName="$USER"

#Make a directory called Dev Tools, its where all the downloads will be stored
dir="/Users/$userName/Desktop/Dev Tools"

mkdir "$dir"

cd "$dir"

#Downloads

urls=( http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg
	https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20194.zip
	https://d38qbqfndhlqd2.cloudfront.net/Flux34-3.zip
	https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%203.0.5.dmg 
	http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/031-03190.20140529.Pp3r4/JavaForOSX2014-001.dmg
	https://s3.amazonaws.com/ublock/ublock-safari-0.9.4.0.safariextz,
	https://dl.google.com/dl/android/studio/install/1.2.2.0/android-studio-ide-141.1980579-mac.dmg
	)

#string to hold the curl command
masterURL=""
open="-O "
space=" "

#combines all of the urls into a single string to pass as a curl argument
for (( i = 0; i < ${#urls[@]}; i++ )); do
	
	masterURL=$masterURL$space$open${urls[i]}

done
printf "\nDownloading Dev Tools...\n\n"

#download errrrrything
curl $masterURL

#Open app store to download things like XCode and shtuff
open -a App\ Store

printf "\nDone-zo!\n\n"
