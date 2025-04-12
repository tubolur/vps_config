TERM_PREFIX="############### "
PKGMANAGER_NAME="apt"

packages_common=(
	"htop"
	"git"
)

install_packet() {
	echo "installing packet $1 using ${PKGMANAGER_NAME}"
	if [[ "${PKGMANAGER_NAME}" == "apt" ]]; then
		sudo apt install "$1"
	fi

}

install_packages() {
	echo "${TERM_PREFIX}Installing common packages"
	for pkt in "${packages_common[@]}"
	do
		echo "${TERM_PREFIX}installing packet ${pkt}"
		install_packet "${pkt}"
	done
}

install_packages

