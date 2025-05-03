system="$1"
installed_sections=("base" "python" "podman")

logger() {
    bold=$(tput bold)
    normal=$(tput sgr0)

    echo "### ${bold}$1${normal}"
}

load_system_source()  {
    file="data/$system"

    if [ -e "$file" ]; then
        logger "Sourcing packets definitions for ${system}... "
        source $file
    else 
        logger "System definition does not exist : ${file}"
        exit
    fi 
}

install_packet() {
    logger " ... installing $1 ${logsuffix}"
    sudo ${install} ${1}
}

install_bin() {
    logger("installing binary package from binary $1")
}

install_system() {

    logger "Installing system $system"
    load_system_source
    
    logger "Updating system"
    sudo $update

    logger "Installing sections : ${installed_sections[@]}"
    
    for section in "${installed_sections[@]}"
    do
        logger "installing section $section"

        varname=${section}
        declare -n pkts=$varname

        ITER=1
        for s in "${pkts[@]}"
        do
            logsuffix=" ( $ITER  / ${#pkts[@]} )"
            install_packet $s
            ITER=$(expr $ITER + 1)
        done

        logsuffix=""

    done

}

clear
install_system
