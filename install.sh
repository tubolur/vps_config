system="archlinux"
installed_sections=("base" "cockpit" "podman" "docker")

logger() {
    bold=$(tput bold)
    normal=$(tput sgr0)

    echo "### ${bold}$1${normal}"
}

install_packet() {
    logger " ... ${logprefix} installing $1"
    sudo ${install} ${1}
}

install_system() {

    logger "Sourcing packets definitions ... "
    source $system

    logger "Installing system $system"

    logger "Updating system"
    sudo $update

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
