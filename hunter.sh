#!/bin/bash

###################
###Color Output####

RESET="\e[0m"
GRAY="\e[1;30m"
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
WHYTE="\e[1;37m"

################### Functions ##########################################

banner () {
echo -e "${RED}_                 _            ${RESET}"
echo -e "${RED}| |__  _   _ _ __ | |_ ___ _ __ ${RESET}"
echo -e "${RED}| '_ \| | | | '_ \| __/ _ \ '__|${RESET}"
echo -e "${RED}| | | | |_| | | | | ||  __/ |   ${RESET}"
echo -e "${RED}|_| |_|\__,_|_| |_|\__\___|_|   ${RESET}"
echo -e "${GREEN}         Created by KmzerSec  ${RESET}"
}

divider () {
	echo
	echo -e "${PURPLE}=====================================${RESET}"
	echo
}

help () {
	banner
	echo
	echo -e "USAGE:$0 [DOMAIN...] [OPTIONS...]"
	echo -e "\t-h , --help    Help menu "
	echo -e "\t-hb , --httprobe Get live domains"
	echo -e "\t-u, --urls get all urls"
	echo -e "\t-p , --parameters Get parameters"
	echo -e "\t-w , --waybackurls Get wayback data"
	echo -e "\t--whois      Get whoisdata"
	echo -e "\t-ps , --portscan"
	echo

}
################## Variables #########################################

DOMAIN=$1


if [ $# -eq 0 ] || [ $# -eq 1 ]
then
	help
	exit 1
fi


if ! [ -d "$DOMAIN" ]
then
	mkdir $DOMAIN
	cd $DOMAIN

else
	echo -e "${RED}Directory already exists....Existing.... ${RESET}"
	exit 2
fi


################################## Script ###################################


banner
divider
echo -e "${BLUE}[-]Gathering sub-domains from internet....${RESET}"
subfinder -d $DOMAIN >> sub_domains.txt
assetfinder $DOMAIN >> sub_domains.txt

VALID_DOMAINS=`cat sub_domains.txt | sort -u`

echo
echo $VALID_DOMAINS | tee sub-domains.txt
echo
echo -e "${GREEN}[+]Subdomain gathering completed....${RESET}"
rm sub_domains.txt

############################# Case ###########################################

while [ $# -gt 0 ]
do
	case "$2" in
		"-h" | --help )
			help
			exit 4
			;;
			
		"-hx" | "--httx" )
			echo -e "${BLUE}[-]Running httprobe...${RESET}"
			cat sub-domains.txt | httpx | tee live-subdomain.txt
			echo -e "${GREEN}[-]Live sub-domains gathered...${RESET}"
			divider

			shift
			shift
			;;

		"-u" | "--urls" )
			echo -e "${BLUE}[-]Gathering urls from gau...${RESET}"

			gau $DOMAIN | tee urls.txt
			echo -e "${GREEN}[+]URLS gathered...${RESET}"
			divider
			shift
			shift
			;;

		"-p" | "--parameter"  )
			echo -e "${BLUE}[-]Gathering parameters using paramspider...${RESET}"

			paramspider -d $DOMAIN | tee parameter.txt
			echo -e "${GREEN}[+]Parameters gathered...${RESET}"
			divider
			shift
			shift
			;;

		"-w" | "--wayback" )
			echo -e "${BLUE}[-]Gathering wayback data...${RESET}"

			waybackurls $DOMAIN | tee waybackurls.txt
			echo -e "${GREEN}[+]Waybackurls gathered...${RESET}"
			divider
			shift
			shift
			;;

		"--whois" )
			echo -e "${BLUE}[-]Gathering whois from whois.com...${RESET}"

			curl -s https://www.whois.com/whois/$DOMAIN | grep -A 70 "Registry Domain ID:" | tee whois.txt
			echo -e "${GREEN}[+]Whoidata gathered...${RESET}"
			divider
			shift
			;;

		"-ps" | "--portscan")
			echo -e "${BLUE}[-]Scanning open ports....${RESET}"

			naabu -silent -host $DOMAIN | tee openport.txt
			echo -e "${GREEN}[+]Scanning completed...${RESET}"

			shift
			shift
			;;

	esac
done

########################################################################################
divider
echo -e "${BLUE}RECON COMPLETED...${RESET}"
divider
