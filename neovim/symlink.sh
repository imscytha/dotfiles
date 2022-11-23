#!/usr/bin/bash
# Terminal colors
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
CYANBG=$(tput setab 6)
#
BOLD=$(tput bold)
ITALIC=$(tput sitm)
RESET=$(tput sgr0)
DIM=$(tput dim)
#

#Terminal Geometry
COLS=$(tput cols)
#

#GLOBAL VARIABLES
CONFIG_DIR="$HOME/.config/nvim"
NVCHAD_URL="https://github.com/NvChad/NvChad.git"
#

function banner {
	LOGO=("                      .__  .__        __               .__     " "  _________.__. _____ |  | |__| ____ |  | __      _____|  |__  " " /  ___<   |  |/     \|  | |  |/    \|  |/ /     /  ___/  |  \ " " \___ \ \___  |  Y Y  \  |_|  |   |  \    <      \___ \|   Y  \\" "/____  >/ ____|__|_|  /____/__|___|  /__|_ \ /\ /____  >___|  /" "     \/ \/          \/             \/     \/ \/      \/     \/ ")
	for i in "${!LOGO[@]}"; do
		printf "%*s%s\n" $((COLS/2 - ${#LOGO[$i]}/2)) "" "${BOLD}$(tput setaf $(($i+1)))${LOGO[i]}${RESET}"
	done
	GREETER="Welcome to the Neovim configuration installer!"
	printf "\n%*s%s\n" $((COLS/2 - ${#GREETER}/2)) "" "${BLUE}${BOLD}$GREETER${RESET}" 
	DESCRIPTION="${DIM}This script will generate a symbolic link for NvChad custom config${RESET}"
	printf "%*s%s\n" $((COLS/2 - ${#DESCRIPTION}/2)) "" "${ITALIC}$DESCRIPTION${RESET}" 
}

function symlink {
	printf "\n%s  %s" "${BOLD}${BLUE}===>${RESET}" "Adding the new configurations by creating the symbolic link${RESET}"
	for i in {1..3}; do
		sleep .3
		printf "."
		sleep .4
	done
	ln -sfn "$(pwd)"/custom "$CONFIG_DIR"/lua
	if [[ $? -eq 0 ]]; then
		printf "\n%s  %s\n" "${BOLD}${GREEN}===>${RESET}" "Symbolic link created successfully${RESET}" 
		START="Now you can start neovim and run ${BOLD}:PackerSync${RESET}"
		printf "${CYANBG}\n%*s%s\n" $((COLS/2 - (${#START}-${#BOLD}-${#RESET})/2)) "" "$START${RESET}" 
		printf "\n${DIM}${BOLD}${ITALIC}${ORANGE}%s${RESET}\n" "NOTE: This is a helper script inteded to be run if you choose to keep the dotfiles repository. Should you change the location of this repository, you will have to run this script again."
	else
		printf "\n%s  %s" "${BOLD}${RED}===>${RESET}" "${BOLD}Symbolic link creation failed${RESET}"
	fi
}

function checkCustomDir {
	if [[ -d "$CONFIG_DIR"/lua/custom ]]; then
		printf "\n%s  %s\n" "${BOLD}${BLUE}===>${RESET}" "${BOLD}A custom config directory already exists!${RESET}"
		printf "%s  " "${BOLD}${ORANGE}===>${RESET}"
		read -p "${BOLD}Do you want to replace it? [y/n]: " -n 1 -r OVERRIDE
		while [[ ! $OVERRIDE =~ ^[YyNn]$ ]]; do
			printf "\n%s  %s\n" "${BOLD}${RED}===>${RESET}" "${ITALIC}${BOLD}Invalid option!${RESET}"
			printf "%s  " "${BOLD}${ORANGE}===>${RESET}"
			read -p "${BOLD}Do you want to replace it? [y/n]: " -n 1 -r OVERRIDE
		done
		if [[ $OVERRIDE =~ ^[Yy]$ ]]; then
			rm -rf "$CONFIG_DIR"/lua/custom
			symlink
		else
			printf "\n%s  %s\n" "${BOLD}${RED}===>${RESET}" "${ITALIC}Aborting...${RESET}"
			exit 1
		fi
	else
		symlink
	fi
}

function installNvChad {
	printf "\n%s  %s" "${BOLD}${GREEN}===>${RESET}" "Installing NvChad${RESET}"
	for i in {1..3}; do
		sleep .3
		printf "."
		sleep .4
	done
	git clone $NVCHAD_URL "$CONFIG_DIR" --depth 1 --quiet
	if [ $? -eq 0 ]; then
		printf "\n%s  %s" "${BOLD}${GREEN}===>${RESET}" "${BOLD}NvChad installed successfully${RESET}"
		symlink
	else
		printf "\n%s  %s" "${BOLD}${RED}===>${RESET}" "${BOLD}NvChad installation failed${RESET}"
		exit 1
	fi
}

function checkIfNvChadInstalled {
	printf "\n%s  %s" "${BOLD}${BLUE}===>${RESET}" "Checking if NvChad is installed${RESET}"
	for i in {1..3}; do
		sleep .3
		printf "%s" "."
		sleep .4
	done
	if [ ! -d "$CONFIG_DIR" ]; then
		printf "\n%s  %s" "${BOLD}${RED}===>${RESET}" "${BOLD}NvChad is not installed in your system!${RESET}"
		printf "\n%s  " "${BOLD}${ORANGE}===>${RESET}"
		read -p "Do you want to install it now? [Y/n] " -n 1 -r INSTALL
		while [[ ! $INSTALL =~ ^[YyNn]$ ]]; do
			printf "\n%s  %s" "${BOLD}${RED}===>${RESET}" "${ITALIC}${BOLD}Invalid option!${RESET}"
			printf "\n%s  " "${BOLD}${ORANGE}===>${RESET}"
			read -p "Do you want to install it now? [Y/n] " -n 1 -r INSTALL
		done
		if [[ $INSTALL =~ ^[Yy]$ ]]; then
			installNvChad
		else
			printf "\n%s  %s\n" "${BOLD}${RED}===>${RESET}" "${ITALIC}Aborting...${RESET}"
			exit 1
		fi
	else
		printf "\n%s  %s" "${BOLD}${GREEN}===>${RESET}" "${BOLD}NvChad is installed in your system!${RESET}"
		checkCustomDir
	fi
}

banner
sleep 0.7
checkIfNvChadInstalled
