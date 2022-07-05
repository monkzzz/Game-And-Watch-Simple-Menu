colors=1

### Colors ###
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30M" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"


### Color Functions ###

if [[ $colors == 1 ]]
then
	optionprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
	returnprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
	exitprint() { printf "${RED}%s${RESET}\n" "$1"; }
	menuprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
	mainmenuprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
else
	optionprint() { printf "${DEFAULT}%s${RESET}\n" "$1"; }
	returnprint() { printf "${DEFAULT}%s${RESET}\n" "$1"; }
	exitprint() { printf "${DEFAULT}%s${RESET}\n" "$1"; }
	menuprint() { printf "${DEFAULT}%s${RESET}\n" "$1"; }
	mainmenuprint() { printf "${DEFAULT}%s${RESET}\n" "$1"; }
fi
