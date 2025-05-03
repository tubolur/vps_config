system="$1"
installed_sections=("base" "python" "cockpit" "podman" "docker")

logger() {
    bold=$(tput bold)
    normal=$(tput sgr0)

    echo "### ${bold}$1${normal}"
}

load_system_source()  {
    if [ -e "$system" ]; then
        logger "Sourcing packets definitions for ${system}... "
        source $system
    else 
        logger "System definition does not exist : ${system}"
        exit
    fi 
}

install_packet() {
    logger " ... ${logprefix} installing $1"
    sudo ${install} ${1}
}

install_system() {

    logger "Installing system $system"
    load_system_source
    
    logger "Updating system"
    sudo $update

    logger "Installing sections : $sections"
    for section in "${installed_sections[@]}"
    do
        logger "installing section $section"

        varname=${section}
        declare -n pkts=$varname

        ITER=1
        for s in "${pkts[@]}"
        do
            logprefix="$ITER  / ${#pkts[@]}"
            install_packet $s
            ITER=$(expr $ITER + 1)
        done

    done

}

clear
install_system
