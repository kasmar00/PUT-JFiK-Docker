# Docker Image for JFiK/FLC

Dockerfile for creating a docker image with all tools required for laboratory in Języki Formalne i Kompilatory (Formal Languages and Compilers) on Poznań University of Technology

Author: Marcin Kasznia ([Github](https://github.com/kasmar00)) April 2021

The image contains the following tools:

- `gcc` (version 7.5.0)
- `awk` (`gawk`, version 4.1.4)
- `lex` (`flex`, version 2.6.4)
- `LLgen` (version 6.0pre5)
- `bison` (version 3.0.4)

This project could not be created without the ACK installation script by Piotr Tylczyński (https://gitlab.ptl.cloud/piotr/ack-build)

Prerequisites: docker

## Install

Copy this repository to your local computer, using your favourite way (ex. `$ git clone`)

Scripts for installation are provided:

- `build.sh` - builds docker image, the ack tools are compiled on build (this may take several minutes)
- `install.sh` - add the alias `jfik` to `~/.bashrc` to run the container, please check the script before running to make sure you know what you are doing

Note: the image requires about 1GB disk space for installation and downloads around (in addition to ubuntu bionic image) 300MB of packages (updating with apt-get). On fast internet conecction (1Gb/s) the whole installation takes about 5 minutes.

In the last 10-20 lines of output there should be a line `Build completed successfully.` two-three lines before the blue lines (`If llgen command ...`). This should serve as a confirmation that the ACK tools were installed. Unfortunatelly, the installation script fails silently and after it's failure the container will continue build (and succeed).

## Usage

- The container is intended to be used with the makefiles provided by course instructor.
- To compile an exercise source code:
  1. `cd` into a directory with makefile and excercise files.
  2. run `$ jfik make` (assuming you previously ran `install.sh`)
     The docker image will start, mount current working direcotry, run the `make` command in it and save resulting files to current directory. Build binary files may be used from locaal shell.
- Alternatively you can use the installed tools manually, ex. `$ jfik LLgen gram.g` but keep in mind, that the container has only acces to current directory.
- You can also run an interactive shell `$ jfik` (for example in your main course directory) and compile/run using it as if you were in a virtual machine. The files will be updated, as a current working direcotry is mounted (not copied) in container.
