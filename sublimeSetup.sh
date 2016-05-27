#!/bin/sh

#Setting up Sublime Text
#Ensuring Sublime Text has been opened at least once so support files are generated
echo "Opening Sublime Text"
open -a Sublime\ Text
sleep 1.0
killall Sublime\ Text
echo "Closing Sublime Text"



echo "Downloading Package Control"
curl -o /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
echo "Done!"

#Set up Alcatraz for XCode
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh



