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
TOOL="Neovim"
CONFIG_DIR="$HOME/.config/nvim"
NOTE="NOTE: This is a helper script inteded to be run if you choose to keep the dotfiles repository. Should you change the location of this repository, you will have to run this script again."
SYMFILEXDIR="custom"
#

function banner {
	LOGO=("       ..              .       " "     .:ol.             d:.     " "   .cooool;            ooo:.   " "  ,ooooolllc           ooooo:. " "';;;looolllll'         oooooooc" ",;;;,:oollllll;        oooooooo" ",,,,,,;llllllllc.      llllllll" "',,,,,,,.cccccccc'     llllllll" "',,,,,,,  :ccccccc;    llllllll" "',,,,,,,   .ccccccc:.  cccccccc" ".,,,,,,,     cccccccc, cccccccc" ".,,,,,,,      ,:::::::;cccccccc" ".,,,,,,,       .:::::::lccccccc" ".,,,,,,,         ::::::llc:::::" " '''''''          '::::cccc::: " "   '''''            ;;;ccccc   " "     .''             ;;ccc     " "       .              .:       ")
  LOGOCOL=("G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjszMDs1OTszNW0uG1swbRtbMzg7MjsyNjs0MTsxNW0uG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyOzI7MW0gG1swbRtbMzg7MjszNjs1NDsxN20uG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbQo=" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyMDszOTsyNG0uG1swbRtbMzg7Mjs3MTsxMjk7NjltOhtbMG0bWzM4OzI7MTA0OzE4Mzs5MG1vG1swbRtbMzg7MjsxMDE7MTU2OzUxbWwbWzBtG1szODsyOzQ1OzY4OzIxbS4bWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzI7MjsxbSAbWzBtG1szODsyOzExOTsxNzk7NTdtZBtbMG0bWzM4OzI7ODM7MTI1OzQwbTobWzBtG1szODsyOzI1OzM5OzEybS4bWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtCg==" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyMzs0NjsyOG0uG1swbRtbMzg7Mjs3MjsxMzM7NzFtYxtbMG0bWzM4OzI7MTAyOzE4MDs4OW1vG1swbRtbMzg7MjsxMDI7MTgwOzg5bW8bWzBtG1szODsyOzEwMjsxODA7ODltbxtbMG0bWzM4OzI7MTAyOzE1OTs1M21vG1swbRtbMzg7MjsxMDE7MTU2OzUwbWwbWzBtG1szODsyOzcwOzEwOTszNW07G1swbRtbMzg7MjszOzU7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsxOzI7MW0gG1swbRtbMzg7MjsxMTU7MTc2OzU3bW8bWzBtG1szODsyOzExNTsxNzY7NTdtbxtbMG0bWzM4OzI7MTE1OzE3Njs1N21vG1swbRtbMzg7Mjs4NTsxMzA7NDJtOhtbMG0bWzM4OzI7Mjk7NDU7MTVtLhtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0K" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzM5OzU2bSAbWzBtG1szODsyOzI3Ozk5Ozk4bSwbWzBtG1szODsyOzk2OzE3Mjs4Nm1vG1swbRtbMzg7Mjs5OTsxNzc7ODdtbxtbMG0bWzM4OzI7OTk7MTc3Ozg3bW8bWzBtG1szODsyOzk5OzE3Nzs4N21vG1swbRtbMzg7Mjs5OTsxNzc7ODdtbxtbMG0bWzM4OzI7OTk7MTU3OzUzbWwbWzBtG1szODsyOzk4OzE1NDs1MG1sG1swbRtbMzg7Mjs5ODsxNTQ7NTBtbBtbMG0bWzM4OzI7ODg7MTM3OzQ0bWMbWzBtG1szODsyOzIxOzMzOzExbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzE7MjsxbSAbWzBtG1szODsyOzExMTsxNzI7NTZtbxtbMG0bWzM4OzI7MTExOzE3Mjs1Nm1vG1swbRtbMzg7MjsxMTE7MTcyOzU2bW8bWzBtG1szODsyOzExMTsxNzI7NTZtbxtbMG0bWzM4OzI7MTExOzE3Mjs1Nm1vG1swbRtbMzg7Mjs4NjsxMzQ7NDRtOhtbMG0bWzM4OzI7MzQ7NTQ7MThtLhtbMG0bWzM4OzI7MDswOzBtIBtbMG0K" "G1swbRtbMzg7MjswOzg1OzEyNG0nG1swbRtbMzg7MjswOzEyNjsxODNtOxtbMG0bWzM4OzI7MDsxMjE7MTc3bTsbWzBtG1szODsyOzIxOzExOTsxMzhtOxtbMG0bWzM4OzI7ODE7MTU3Ozg5bWwbWzBtG1szODsyOzk3OzE3NDs4N21vG1swbRtbMzg7Mjs5NzsxNzU7ODdtbxtbMG0bWzM4OzI7OTc7MTc0Ozg3bW8bWzBtG1szODsyOzk2OzE1NDs1M21sG1swbRtbMzg7Mjs5NTsxNTI7NTBtbBtbMG0bWzM4OzI7OTY7MTUyOzUwbWwbWzBtG1szODsyOzk1OzE1Mjs1MG1sG1swbRtbMzg7Mjs5NTsxNTE7NTBtbBtbMG0bWzM4OzI7NTA7ODA7MjZtJxtbMG0bWzM4OzI7MzszOzNtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MTsxOzBtIBtbMG0bWzM4OzI7MTA3OzE2OTs1NW1vG1swbRtbMzg7MjsxMDc7MTY5OzU1bW8bWzBtG1szODsyOzEwNzsxNjk7NTVtbxtbMG0bWzM4OzI7MTA3OzE2OTs1NW1vG1swbRtbMzg7MjsxMDc7MTY5OzU1bW8bWzBtG1szODsyOzEwNzsxNjk7NTVtbxtbMG0bWzM4OzI7MTA3OzE2OTs1NW1vG1swbRtbMzg7Mjs4NTsxMzQ7NDRtYxtbMG0K" "G1swbRtbMzg7MjswOzk4OzE0Nm0sG1swbRtbMzg7MjswOzEyMjsxODFtOxtbMG0bWzM4OzI7MDsxMjI7MTgxbTsbWzBtG1szODsyOzA7MTIxOzE4MG07G1swbRtbMzg7Mjs2OzExMzsxNTdtLBtbMG0bWzM4OzI7NTg7MTM3Ozk5bTobWzBtG1szODsyOzk1OzE3Mjs4NW1vG1swbRtbMzg7Mjs5NTsxNzI7ODVtbxtbMG0bWzM4OzI7OTM7MTUyOzUzbWwbWzBtG1szODsyOzkzOzE1MDs1MG1sG1swbRtbMzg7Mjs5MzsxNTA7NTBtbBtbMG0bWzM4OzI7OTM7MTUwOzUwbWwbWzBtG1szODsyOzkzOzE1MDs1MG1sG1swbRtbMzg7Mjs5MzsxNTA7NTBtbBtbMG0bWzM4OzI7NzI7MTE2OzM5bTsbWzBtG1szODsyOzc7MTE7NG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsxOzE7MG0gG1swbRtbMzg7MjsxMDM7MTY1OzU1bW8bWzBtG1szODsyOzEwMzsxNjU7NTVtbxtbMG0bWzM4OzI7MTAzOzE2NTs1NW1vG1swbRtbMzg7MjsxMDM7MTY1OzU1bW8bWzBtG1szODsyOzEwMzsxNjU7NTVtbxtbMG0bWzM4OzI7MTAzOzE2NTs1NW1vG1swbRtbMzg7MjsxMDM7MTY1OzU1bW8bWzBtG1szODsyOzEwMTsxNjI7NTRtbxtbMG0K" "G1swbRtbMzg7MjswOzk1OzE0NG0sG1swbRtbMzg7MjswOzExNzsxNzltLBtbMG0bWzM4OzI7MDsxMTg7MTc5bSwbWzBtG1szODsyOzA7MTE3OzE3OW0sG1swbRtbMzg7MjswOzExODsxNzltLBtbMG0bWzM4OzI7MDsxMTI7MTcwbSwbWzBtG1szODsyOzM0OzEyMDsxMTltOxtbMG0bWzM4OzI7ODU7MTYxOzg0bWwbWzBtG1szODsyOzkwOzE1MDs1M21sG1swbRtbMzg7Mjs5MDsxNDg7NTBtbBtbMG0bWzM4OzI7OTA7MTQ4OzUwbWwbWzBtG1szODsyOzkwOzE0ODs1MG1sG1swbRtbMzg7Mjs5MDsxNDg7NTBtbBtbMG0bWzM4OzI7OTA7MTQ4OzUwbWwbWzBtG1szODsyOzkwOzE0ODs1MG1sG1swbRtbMzg7Mjs4NDsxMzk7NDdtYxtbMG0bWzM4OzI7Mjg7NDc7MTZtLhtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MTA7MTA7MTBtIBtbMG0bWzM4OzI7OTk7MTYxOzU1bWwbWzBtG1szODsyOzk5OzE2MTs1NW1sG1swbRtbMzg7Mjs5OTsxNjE7NTVtbBtbMG0bWzM4OzI7OTk7MTYxOzU1bWwbWzBtG1szODsyOzk5OzE2MTs1NW1sG1swbRtbMzg7Mjs5OTsxNjE7NTVtbBtbMG0bWzM4OzI7OTk7MTYxOzU1bWwbWzBtG1szODsyOzk4OzE1OTs1NG1sG1swbQo=" "G1swbRtbMzg7MjswOzkyOzE0Mm0nG1swbRtbMzg7MjswOzExNDsxNzdtLBtbMG0bWzM4OzI7MDsxMTQ7MTc3bSwbWzBtG1szODsyOzA7MTE0OzE3N20sG1swbRtbMzg7MjswOzExNDsxNzdtLBtbMG0bWzM4OzI7MDsxMTQ7MTc3bSwbWzBtG1szODsyOzA7MTEyOzE3NG0sG1swbRtbMzg7MjsxMzsxMDk7MTQybSwbWzBtG1szODsyOzMxOzU0OzIxbS4bWzBtG1szODsyOzg3OzE0Njs0OW1jG1swbRtbMzg7Mjs4NzsxNDY7NDltYxtbMG0bWzM4OzI7ODc7MTQ2OzQ5bWMbWzBtG1szODsyOzg3OzE0Njs0OW1jG1swbRtbMzg7Mjs4NzsxNDY7NDltYxtbMG0bWzM4OzI7ODc7MTQ2OzQ5bWMbWzBtG1szODsyOzg3OzE0Njs0OW1jG1swbRtbMzg7Mjs4NzsxNDY7NDltYxtbMG0bWzM4OzI7NTI7ODg7MzBtJxtbMG0bWzM4OzI7MTsyOzFtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MTA7MTA7MTBtIBtbMG0bWzM4OzI7OTU7MTU4OzU0bWwbWzBtG1szODsyOzk1OzE1ODs1NG1sG1swbRtbMzg7Mjs5NTsxNTg7NTRtbBtbMG0bWzM4OzI7OTU7MTU4OzU0bWwbWzBtG1szODsyOzk1OzE1ODs1NG1sG1swbRtbMzg7Mjs5NTsxNTg7NTRtbBtbMG0bWzM4OzI7OTU7MTU4OzU0bWwbWzBtG1szODsyOzk1OzE1Nzs1M21sG1swbQo=" "G1swbRtbMzg7MjswOzg5OzE0MG0nG1swbRtbMzg7MjswOzExMDsxNzRtLBtbMG0bWzM4OzI7MDsxMTA7MTc0bSwbWzBtG1szODsyOzA7MTEwOzE3NG0sG1swbRtbMzg7MjswOzExMDsxNzRtLBtbMG0bWzM4OzI7MDsxMTA7MTc0bSwbWzBtG1szODsyOzA7MTEwOzE3NG0sG1swbRtbMzg7MjswOzExMDsxNzRtLBtbMG0bWzM4OzI7MDsyOzJtIBtbMG0bWzM4OzI7ODc7ODc7ODdtIBtbMG0bWzM4OzI7ODA7MTM3OzQ3bTobWzBtG1szODsyOzg0OzE0Mzs0OW1jG1swbRtbMzg7Mjs4NDsxNDM7NDltYxtbMG0bWzM4OzI7ODQ7MTQzOzQ5bWMbWzBtG1szODsyOzg0OzE0Mzs0OW1jG1swbRtbMzg7Mjs4NDsxNDM7NDltYxtbMG0bWzM4OzI7ODQ7MTQzOzQ5bWMbWzBtG1szODsyOzg0OzE0Mzs0OW1jG1swbRtbMzg7Mjs3MTsxMjE7NDFtOxtbMG0bWzM4OzI7MTE7MTk7N20gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7Mjs4Ozg7OG0gG1swbRtbMzg7Mjs5MTsxNTQ7NTNtbBtbMG0bWzM4OzI7OTE7MTU0OzUzbWwbWzBtG1szODsyOzkxOzE1NDs1M21sG1swbRtbMzg7Mjs5MTsxNTQ7NTNtbBtbMG0bWzM4OzI7OTE7MTU0OzUzbWwbWzBtG1szODsyOzkxOzE1NDs1M21sG1swbRtbMzg7Mjs5MTsxNTQ7NTNtbBtbMG0bWzM4OzI7OTE7MTU0OzUzbWwbWzBtCg==" "G1swbRtbMzg7MjswOzg2OzEzOG0nG1swbRtbMzg7MjswOzEwNjsxNzJtLBtbMG0bWzM4OzI7MDsxMDY7MTcybSwbWzBtG1szODsyOzA7MTA2OzE3Mm0sG1swbRtbMzg7MjswOzEwNjsxNzJtLBtbMG0bWzM4OzI7MDsxMDY7MTcybSwbWzBtG1szODsyOzA7MTA2OzE3Mm0sG1swbRtbMzg7MjswOzEwNjsxNzJtLBtbMG0bWzM4OzI7MDsxOzJtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7NDg7NDg7NDhtIBtbMG0bWzM4OzI7NDQ7NzY7MjdtLhtbMG0bWzM4OzI7ODE7MTQxOzQ5bWMbWzBtG1szODsyOzgxOzE0MTs0OW1jG1swbRtbMzg7Mjs4MTsxNDE7NDltYxtbMG0bWzM4OzI7ODE7MTQxOzUwbWMbWzBtG1szODsyOzgxOzE0MTs0OW1jG1swbRtbMzg7Mjs4MTsxNDE7NDltYxtbMG0bWzM4OzI7ODE7MTQxOzQ5bWMbWzBtG1szODsyOzc5OzEzNzs0OG06G1swbRtbMzg7MjszNTs2MTsyMm0uG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7Mjs2OzY7Nm0gG1swbRtbMzg7Mjs4NzsxNTA7NTNtYxtbMG0bWzM4OzI7ODc7MTUwOzUzbWMbWzBtG1szODsyOzg3OzE1MDs1M21jG1swbRtbMzg7Mjs4NzsxNTA7NTNtYxtbMG0bWzM4OzI7ODc7MTUwOzUzbWMbWzBtG1szODsyOzg3OzE1MDs1M21jG1swbRtbMzg7Mjs4NzsxNTA7NTNtYxtbMG0bWzM4OzI7ODc7MTUwOzUzbWMbWzBtCg==" "G1swbRtbMzg7MjswOzgzOzEzNm0uG1swbRtbMzg7MjswOzEwMjsxNjltLBtbMG0bWzM4OzI7MDsxMDM7MTY5bSwbWzBtG1szODsyOzA7MTAyOzE2OW0sG1swbRtbMzg7MjswOzEwMzsxNjltLBtbMG0bWzM4OzI7MDsxMDI7MTY5bSwbWzBtG1szODsyOzA7MTAyOzE2OW0sG1swbRtbMzg7MjswOzEwMzsxNjltLBtbMG0bWzM4OzI7MDsxOzJtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MTg7MTg7MThtIBtbMG0bWzM4OzI7MTI7MjE7N20gG1swbRtbMzg7Mjs3ODsxNDA7NTBtYxtbMG0bWzM4OzI7Nzg7MTQwOzUwbWMbWzBtG1szODsyOzc4OzE0MDs1MG1jG1swbRtbMzg7Mjs3ODsxNDA7NTBtYxtbMG0bWzM4OzI7Nzg7MTQwOzUwbWMbWzBtG1szODsyOzc4OzE0MDs1MG1jG1swbRtbMzg7Mjs3ODsxNDA7NTBtYxtbMG0bWzM4OzI7Nzg7MTQwOzUwbWMbWzBtG1szODsyOzU0Ozk4OzM1bSwbWzBtG1szODsyOzU7ODszbSAbWzBtG1szODsyOzgzOzE0Nzs1Mm1jG1swbRtbMzg7Mjs4MzsxNDc7NTJtYxtbMG0bWzM4OzI7ODM7MTQ3OzUybWMbWzBtG1szODsyOzgzOzE0Nzs1Mm1jG1swbRtbMzg7Mjs4MzsxNDc7NTJtYxtbMG0bWzM4OzI7ODM7MTQ3OzUybWMbWzBtG1szODsyOzgzOzE0Nzs1Mm1jG1swbRtbMzg7Mjs4MzsxNDc7NTJtYxtbMG0K" "G1swbRtbMzg7MjswOzgwOzEzNW0uG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzk5OzE2OG0sG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyOzI7Mm0gG1swbRtbMzg7Mjs2ODs2ODs2OG0gG1swbRtbMzg7Mjs1OTsxMDk7NDBtLBtbMG0bWzM4OzI7NzQ7MTM3OzUwbTobWzBtG1szODsyOzc0OzEzNzs1MG06G1swbRtbMzg7Mjs3NDsxMzc7NTBtOhtbMG0bWzM4OzI7NzQ7MTM3OzUwbTobWzBtG1szODsyOzc0OzEzODs1MG06G1swbRtbMzg7Mjs3NDsxMzc7NTBtOhtbMG0bWzM4OzI7NzQ7MTM3OzUwbTobWzBtG1szODsyOzY4OzEyNTs0NW07G1swbRtbMzg7Mjs4MjsxNDg7NTNtYxtbMG0bWzM4OzI7Nzk7MTQzOzUxbWMbWzBtG1szODsyOzc5OzE0Mzs1MW1jG1swbRtbMzg7Mjs3OTsxNDM7NTFtYxtbMG0bWzM4OzI7Nzk7MTQzOzUxbWMbWzBtG1szODsyOzc5OzE0Mzs1MW1jG1swbRtbMzg7Mjs3OTsxNDM7NTFtYxtbMG0bWzM4OzI7Nzk7MTQzOzUxbWMbWzBtCg==" "G1swbRtbMzg7MjswOzc3OzEzM20uG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzk1OzE2NW0sG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjszMjszMjszMm0gG1swbRtbMzg7MjsyODs1MzsxOW0uG1swbRtbMzg7Mjs3MTsxMzU7NDltOhtbMG0bWzM4OzI7NzE7MTM1OzQ5bTobWzBtG1szODsyOzcxOzEzNTs0OW06G1swbRtbMzg7Mjs3MTsxMzU7NDltOhtbMG0bWzM4OzI7NzE7MTM1OzQ5bTobWzBtG1szODsyOzcxOzEzNTs0OW06G1swbRtbMzg7Mjs3MTsxMzU7NTBtOhtbMG0bWzM4OzI7ODQ7MTU5OzU4bWwbWzBtG1szODsyOzgwOzE1MDs1NW1jG1swbRtbMzg7Mjs3NjsxNDA7NTFtYxtbMG0bWzM4OzI7NzU7MTQwOzUxbWMbWzBtG1szODsyOzc1OzE0MDs1MW1jG1swbRtbMzg7Mjs3NTsxNDA7NTFtYxtbMG0bWzM4OzI7NzU7MTQwOzUxbWMbWzBtG1szODsyOzc1OzE0MDs1MW1jG1swbQo=" "G1swbRtbMzg7MjswOzczOzEzMW0uG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzkxOzE2M20sG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsxMDsxMDsxMG0gG1swbRtbMzg7MjszOzY7Mm0gG1swbRtbMzg7Mjs2ODsxMzM7NDltOhtbMG0bWzM4OzI7Njg7MTMzOzQ5bTobWzBtG1szODsyOzY4OzEzMzs0OW06G1swbRtbMzg7Mjs2ODsxMzQ7NDltOhtbMG0bWzM4OzI7Njg7MTM0OzQ5bTobWzBtG1szODsyOzY4OzEzMzs0OW06G1swbRtbMzg7Mjs4MDsxNTY7NThtbBtbMG0bWzM4OzI7ODA7MTU2OzU4bWwbWzBtG1szODsyOzc4OzE1Mjs1Nm1jG1swbRtbMzg7Mjs3MzsxMzg7NTFtOhtbMG0bWzM4OzI7NzI7MTM2OzUwbTobWzBtG1szODsyOzcyOzEzNjs1MG06G1swbRtbMzg7Mjs3MjsxMzY7NTBtOhtbMG0bWzM4OzI7NzI7MTM2OzUwbTobWzBtCg==" "G1swbRtbMzg7MjswOzU7OW0gG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzg3OzE2MG0nG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7Mjs1Mzs1Mzs1M20gG1swbRtbMzg7Mjs0NDs4ODszM20nG1swbRtbMzg7Mjs2NTsxMzE7NDltOhtbMG0bWzM4OzI7NjU7MTMyOzQ5bTobWzBtG1szODsyOzY1OzEzMjs0OW06G1swbRtbMzg7Mjs2NTsxMzE7NDltOhtbMG0bWzM4OzI7NzY7MTUzOzU4bWMbWzBtG1szODsyOzc2OzE1NDs1OG1jG1swbRtbMzg7Mjs3NjsxNTQ7NThtYxtbMG0bWzM4OzI7NzY7MTUyOzU3bWMbWzBtG1szODsyOzcwOzEzOTs1Mm06G1swbRtbMzg7Mjs2ODsxMzI7NDltOhtbMG0bWzM4OzI7Njg7MTMyOzQ5bTobWzBtG1szODsyOzEyOzIzOzltIBtbMG0K" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyNDsyNDsyNG0gG1swbRtbMzg7Mjs2MTs2MTs2MW0gG1swbRtbMzg7MjsxOzc5OzE0OW0nG1swbRtbMzg7MjsxOzg0OzE1OG0nG1swbRtbMzg7MjsxOzg0OzE1OG0nG1swbRtbMzg7MjsxOzg0OzE1OG0nG1swbRtbMzg7MjsxOzg0OzE1OG0nG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsyMjsyMjsyMm0gG1swbRtbMzg7MjsxNTszMTsxMm0gG1swbRtbMzg7Mjs2MjsxMjk7NDltOxtbMG0bWzM4OzI7NjI7MTI5OzQ5bTsbWzBtG1szODsyOzYyOzEyOTs0OW07G1swbRtbMzg7Mjs3MjsxNTA7NThtYxtbMG0bWzM4OzI7NzM7MTUwOzU4bWMbWzBtG1szODsyOzczOzE1MDs1OG1jG1swbRtbMzg7Mjs3MzsxNTA7NThtYxtbMG0bWzM4OzI7NzM7MTUwOzU4bWMbWzBtG1szODsyOzc7MTQ7NW0gG1swbRtbMzg7MjszNTszNTszNW0gG1swbRtbMzg7MjsxOzE7MW0gG1swbQo=" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsxODsxODsxOG0gG1swbRtbMzg7Mjs1NTs1NTs1NW0gG1swbRtbMzg7MjsxOzY4OzEzNG0uG1swbRtbMzg7MjsxOzc5OzE1NW0nG1swbRtbMzg7MjsxOzc5OzE1NW0nG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7Mjs0OzQ7NG0gG1swbRtbMzg7Mjs2OTs2OTs2OW0gG1swbRtbMzg7Mjs1NTsxMTc7NDVtOxtbMG0bWzM4OzI7NTk7MTI3OzQ5bTsbWzBtG1szODsyOzY5OzE0Nzs1N21jG1swbRtbMzg7Mjs2OTsxNDg7NTdtYxtbMG0bWzM4OzI7Njk7MTQ3OzU3bWMbWzBtG1szODsyOzI7NTsybSAbWzBtG1szODsyOzM2OzM2OzM2bSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtG1szODsyOzA7MDswbSAbWzBtCg==" "G1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjsxNDsxNDsxNG0gG1swbRtbMzg7Mjs1MDs1MDs1MG0gG1swbRtbMzg7MjsxOzU2OzExM20uG1swbRtbMzg7MjswOzE7Mm0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjswOzA7MG0gG1swbRtbMzg7MjszNzszNzszN20gG1swbRtbMzg7MjsyODs2MzsyNW0uG1swbRtbMzg7Mjs2MTsxMzU7NTNtOhtbMG0bWzM4OzI7ODM7ODM7ODNtIBtbMG0bWzM4OzI7MzE7MzE7MzFtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0bWzM4OzI7MDswOzBtIBtbMG0K")
	for i in "${!LOGO[@]}"; do
    printf "%*s${BOLD}$(base64 -d <<< ${LOGOCOL[i]})${RESET}\n" $((COLS/2 - ${#LOGO[$i]}/2)) "" 
	done
	# printf "%*s%s\n" $((COLS/2 - ${#LOGO[$i]}/2)) "" "${BOLD}$(tput setaf $i+1)${LOGO[i]}${RESET}"
	GREETER="Welcome to the $TOOL configuration installer!"
	printf "\n%*s%s\n" $((COLS/2 - ${#GREETER}/2)) "" "${BLUE}${BOLD}$GREETER${RESET}" 
	DESCRIPTION="${DIM}This script will generate a symbolic link for $TOOL custom config${RESET}"
	printf "%*s%s\n" $((COLS/2 - ${#DESCRIPTION}/2)) "" "${ITALIC}$DESCRIPTION${RESET}" 
}

function symlink {
	printf "\n%s  %s" "${BOLD}${BLUE}===>${RESET}" "Adding the new configurations by creating the symbolic link${RESET}"
	for i in {1..3}; do
		sleep .3
		printf "."
		sleep .4
	done
	if ln -sfn "$(pwd)/$SYMFILEXDIR" "$CONFIG_DIR"/lua
	then
		printf "\n%s  %s\n" "${BOLD}${GREEN}===>${RESET}" "Symbolic link created successfully${RESET}" 
		START="Now you can start $TOOL and run ${BOLD}:PackerSync${RESET}"
		printf "${CYANBG}\n%*s%s\n" $((COLS/2 - (${#START}-${#BOLD}-${#RESET})/2)) "" "$START${RESET}" 
		printf "\n${DIM}${BOLD}${ITALIC}${ORANGE}%s${RESET}\n" "$NOTE"
	else
		printf "\n%s  %s" "${BOLD}${RED}===>${RESET}" "${BOLD}Symbolic link creation failed${RESET}"
	fi
}

function checkCustomDir {
	if [[ -d "$CONFIG_DIR"/lua/$SYMFILEXDIR ]]; then
		printf "\n%s  %s\n" "${BOLD}${BLUE}===>${RESET}" "${BOLD}A custom config directory already exists!${RESET}"
		printf "%s  " "${BOLD}${ORANGE}===>${RESET}"
		read -p "${BOLD}Do you want to replace it? [y/n]: " -n 1 -r OVERRIDE
		while [[ ! $OVERRIDE =~ ^[YyNn]$ ]]; do
			printf "\n%s  %s\n" "${BOLD}${RED}===>${RESET}" "${ITALIC}${BOLD}Invalid option!${RESET}"
			printf "%s  " "${BOLD}${ORANGE}===>${RESET}"
			read -p "${BOLD}Do you want to replace it? [y/n]: " -n 1 -r OVERRIDE
		done
		if [[ $OVERRIDE =~ ^[Yy]$ ]]; then
			mv "$CONFIG_DIR/lua/$SYMFILEXDIR" "$CONFIG_DIR/lua/$SYMFILEXDIR.backup" 
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
	if git clone https://github.com/NvChad/NvChad.git "$CONFIG_DIR" --depth 1 --quiet
	then
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
