#!/bin/bash

echo "Project for creating a docker image with all tools required for laboratory in Języki Formalne i Kompilatory (Formal Languages and Compilers)  on Poznań Univeristy of Technology"
echo "This project could not be created without the ACK installation script created by Piotr Tylczyński (https://gitlab.ptl.cloud/piotr/ack-build)"
echo 
echo "Prerequisites: docker"
echo "Created and tested on Docker 19.03.13 under Ubuntu 20.04.2 LTS x86_64"
echo
echo "This script builds the docker image, the ACK tools are compiled on every build (this may take several minutes)"
echo
echo "Press any key to continue or ctrl + c to abort..."
read  -n 1


docker build -t kasmar00/pp-jfik:1.0 .