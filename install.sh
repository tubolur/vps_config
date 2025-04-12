TERM_PREFIX="############### "
PKGMANAGER_NAME="apt"

packages_common=(
	"htop"
	"git"
)

packages_specific=(
)

install_packet() {
	echo "installing packet $1 using ${PKGMANAGER_NAME}"
	if [[ "${PKGMANAGER_NAME}" == "apt" ]]; then
		sudo apt install "$1"
 	fi
  	if [[ "${PKGMANAGER_NAME}" == "pacman" ]]; then
		sudo pacman -Sy "$1"
	fi
 	if [[ "${PKGMANAGER_NAME}" == "dnf" ]]; then
		sudo dnf install "$1"
	fi

}

install_packages() {
	echo "${TERM_PREFIX}Installing common packages"
	for pkt in "${packages_common[@]}"
	do
		echo "${TERM_PREFIX}installing packet ${pkt}"
		install_packet "${pkt}"
	done

 	echo "${TERM_PREFIX}Installing distro specific packages"
	for pkt in "${packages_specific[@]}"
	do
		echo "${TERM_PREFIX}installing packet ${pkt}"
		install_packet "${pkt}"
	done
}

install_packages

