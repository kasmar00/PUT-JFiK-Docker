#!/bin/bash

echo "This script is intended for creating aliases for running the container for compilation fo programs"
echo "Before running please make sure you know what this script does, change the alias or file and remove the line containging exit"

# exit


# adding alias to ~/.bashrc
cp ~/.bashrc ~/.bashrc.old-jfik
printf "\nalias jfik='docker run --rm -v \"\$PWD\":/usr/src/myapp -w /usr/src/myapp -it kasmar00/pp-jfik:1.0'\n" >> ~/.bashrc
