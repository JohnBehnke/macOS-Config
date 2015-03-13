#!/bin/sh

#First, get the xcode dev tools, which includes gcc and other swag
xcode-select --install


#second, get brew, becuase that is the best ever of all time
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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



#Download Sublime Text 3, GitHub for Mac,f.lux, Dropbox, Java, and flash (ehk, nasty), and a monokai theme for Terminal)

urls=( http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg
	https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20194.zip
	https://d38qbqfndhlqd2.cloudfront.net/Flux34-3.zip
	https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%203.0.5.dmg 
	http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/031-03190.20140529.Pp3r4/JavaForOSX2014-001.dmg
	http://aihdownload.adobe.com/bin/live/AdobeFlashPlayerInstaller_16_ltrosxd_aaa_aih.dmg, https://github.com/stephenway/monokai.terminal/blob/master/Monokai.terminal
	)

#string to hold the curl command
masterURL=""
open="-O "
space=" "

#combines all of the urls into a single string to pass as a curl argument
for (( i = 0; i < ${#urls[@]}; i++ )); do
	
	masterURL=$masterURL$space$open${urls[i]}

done
printf "\nDownloading Dev Tools...\n"

#download errrrrything
curl $masterURL

#Open app store to download things like XCode and shtuff
open -a App\ Store

