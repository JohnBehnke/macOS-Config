# EasyDevTools
A small script that downloads a bunch of useful development tools for OS X for when you get a new Mac or a use a fresh install. It uses bash to download the xcode command line tools, brew, valgrind, git, and then it creates a new folder on the Desktop that all of the other tools get downloaded to using cURL. Finally it opens up the App Store for those applications that can't be download directly from the web. 

#How to use
All you have to do is run easyDev.sh as root.

`sudo bash easyDev.sh`. 

You can run it with out root, but you will probably (100% certainly) have to rerun it as root anyways for things like the xcode command line tools to install.
