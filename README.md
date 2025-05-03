# CONFIG TOOLS

This repo includes a few ressources for servers

## install.sh

This script provides quick way to install packages, distribution-independant, using simple configuration files in `data` folder
Call it with
`./install.sh nameofthedistribution` 

You can select which categories to be installed, editing the line at the beginning of the file **install.sh** :
`installed_sections=("base" "python" "podman")`
The available sections are listed below.

### currently supported distributions:
 - [x] archlinux
 - [x] debian

### current sections :
 - [x] base
 - [x] docker
 - [x] podman
 - [x] python

## .bash-aliases
A predefined list of aliases to be added to the `~/.bashrc` or `~/.bash_aliases` file.
