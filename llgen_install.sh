#!/bin/bash
echo -e "\e[34m LLgen installer by Piotr Tylczynski"
echo -e "\e[31m Created and tested on Ubuntu Bionic under Docker Engine"
echo If you use other distro I dont give warranty your computer not become sort of space shuttle or bus stop
echo Press something to continue or ctrl + c to abort...
read  -n 1

echo -e "\e[0m"

# Standard update check
apt-get update

# apt-file is used to index ppa packages
# some lightweight distros like ubuntu image for Docker lacks this
apt-get install -y apt-file
apt-file update
apt-get update
apt-get upgrade -y

# tar and gzip are used to unpack files,
# build-essential consist of make command,
# ed is used during compilation (devs why u do this ;_;, standard is cat, echo and sed)
# bison and flex are additions used by llgen and demanded for install it
apt-get install -y tar wget gzip build-essential gcc ed bison flex

# all files will be downloaded to /tmp/ dir which is flushed by linux on boot
cd /

# github download certs are messed up and who cares about security
wget --no-check-certificate https://codeload.github.com/davidgiven/ack/tar.gz/release-6-0-pre-5

# github mirror ommits file extensions
mv -v release-6-0-pre-5 release-6-0-pre-5.tar.gz

# unpacking files
gunzip release-6-0-pre-5.tar.gz
tar -vxf release-6-0-pre-5.tar
cd ack-release-6-0-pre-5/

# during compilation some script tries to redefine __fsid_t which end ups in compilation failure code 1
# for compilation purpouse we alter this kernel files with some funny text
# just trust ma, its working... ;) (...mostly)
sed -i 's/__STD_TYPE __FSID_T_TYPE __fsid_t;/\/\/its_better_not_to_mess_with/' /usr/include/x86_64-linux-gnu/bits/types.h
sed -i 's/typedef __fsid_t fsid_t;/\/\/kernel_files_if_u_dont_know_what_are_u_doing/' /usr/include/x86_64-linux-gnu/sys/types.h

# compilation
make

# removing funny text and bringin back old values
sed -i 's/\/\/its_better_not_to_mess_with/__STD_TYPE __FSID_T_TYPE __fsid_t;/' /usr/include/x86_64-linux-gnu/bits/types.h
sed -i 's/\/\/kernel_files_if_u_dont_know_what_are_u_doing/typedef __fsid_t fsid_t;/' /usr/include/x86_64-linux-gnu/sys/types.h

# add new binary folder into systempath
echo PATH=\"$PATH:/ack-build/bin\" > /etc/environment

# ack defaultly build into /tmp so we nedd to take it to root, so it will not be flushed during system shutdown
mv -v /tmp/ack-build /

# remove archive containing build files
rm /ack-release-6-0-pre-5.tar

# reload systempath
# in some cases it is not working, idk why tbh
source /etc/environment

echo -e "\e[34m If llgen command is not working issue \"source /etc/environment\""
echo If its still not working contact me
echo -e "\e[0m"
