menu() {
printf '\e[8;35;120t'
clear

case $SHELL in
	*bash)
		ECHO='echo -e'
		;;
	*)
		ECHO='echo'
		;;
esac

purple="\033[0;35m"
pink="\033[38;5;198m"
green="\033[1;32m"
white="\033[97m"
blue="\033[1;34m"

${ECHO} "$blue"
${ECHO} " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄ "
${ECHO} "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌"
${ECHO} "▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀  ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ "
${ECHO} "▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌          ▐░▌     ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌          "
${ECHO} "▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌          ▐░▌     ▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ "
${ECHO} "▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░▌          ▐░▌     ▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌"
${ECHO} "▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░▌          ▐░▌     ▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌"
${ECHO} "▐░▌       ▐░▌▐░▌               ▐░▌          ▐░▌     ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌          ▐░▌"
${ECHO} "▐░█▄▄▄▄▄▄▄█░▌▐░▌               ▐░▌      ▄▄▄▄█░█▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌ ▄▄▄▄▄▄▄▄▄█░▌"
${ECHO} "▐░░░░░░░░░░░▌▐░▌               ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌"
${ECHO} " ▀▀▀▀▀▀▀▀▀▀▀  ▀                 ▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀ "
printf "\n\n"

printf ""$white"["$pink"01"$white"] Change primary language"$pink"      "$white"["$pink"02"$white"] Change secondary language"$pink"      "$white"["$green"99"$white"] "$green"Back"$white"\n\n"
read -p '-->' option

if [[ $option == 1 || $option == 01 ]]; then
primMenu

elif [[ $option == 2 || $option == 02 ]]; then
secMenu

elif [[ $option == 99 ]]; then
clear
exit

else
clear
menu
fi
}

primMenu() {
> lng_opt/sl.txt
read -p 'Choose your primary language in lowercase (tr, en, de, ...)' primOpt
if [[ $primOpt == '' ]]; then
primMenu
fi
echo $primOpt >> lng_opt/sl.txt
sed -i '/^$/d' lng_opt/sl.txt
clear
menu
}

secMenu() {
> lng_opt/tl.txt
read -p 'Choose your secondary language in lowercase (tr, en, de, ...)' secOpt
if [[ $secOpt == '' ]]; then
secMenu
fi
echo $secOpt >> lng_opt/tl.txt
sed -i '/^$/d' lng_opt/tl.txt
clear
menu
}
menu