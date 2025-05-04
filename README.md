# CONFIG TOOLS

This repo includes a few ressources for quick linux distros init.

## .bash-aliases

A predefined list of aliases to be added to the `~/.bashrc` or `~/.bash_aliases` file.

## install.sh

This script provides quick way to install packages, distribution-independant, using simple configuration files in `data` folder.

Call it with
`./install.sh nameofthedistribution` 

You can select which categories to be installed, editing the line at the beginning of the file **install.sh** :
`installed_sections=("base" "python" "podman")`

The available sections are listed below, they are defined in text files into `data` subfolder.

There is also a way to define binary packages to be directy downloaded from any website.The entries are listed in the `data/bin` file.

### currently supported distributions:
 - [x] archlinux
 - [x] debian

### current sections :
 - [x] base
 - [x] docker
 - [x] podman
 - [x] python


