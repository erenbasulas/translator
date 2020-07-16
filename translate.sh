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

${ECHO} "$white"
${ECHO} " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄            ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ "$pink""
${ECHO} "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌"$blue""
${ECHO} " ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌          ▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ "$white""
${ECHO} "     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌          ▐░▌          ▐░▌       ▐░▌     ▐░▌     ▐░▌          "$pink""
${ECHO} "     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌          ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄▄▄ "$blue""
${ECHO} "     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌"$white""
${ECHO} "     ▐░▌     ▐░█▀▀▀▀█░█▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌   ▐░▌ ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌▐░▌          ▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     ▐░█▀▀▀▀▀▀▀▀▀ "$pink""
${ECHO} "     ▐░▌     ▐░▌     ▐░▌  ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌          ▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     ▐░▌          "$blue""
${ECHO} "     ▐░▌     ▐░▌      ▐░▌ ▐░▌       ▐░▌▐░▌     ▐░▐░▌ ▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄▄▄ "$white""
${ECHO} "     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌     ▐░▌     ▐░░░░░░░░░░░▌"$pink""
${ECHO} "      ▀       ▀         ▀  ▀         ▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀       ▀       ▀▀▀▀▀▀▀▀▀▀▀ "$blue""

printf "\n\n"
${ECHO} $green"                                                                                                 Version: "$pink"1.0\n"
${ECHO} $blue"              The Program gets the data from Google Translate ("$pink"https://translate.google.com"$blue")\n"
${ECHO} $white "                                        Made by Eren "$blue"("$pink"erenbasulas"$blue")"$white""

printf "\n\n"

printf ""$white"["$pink"01"$white"] Start"$pink"      "$white"["$pink"02"$white"] Change primary language"$pink"      "$white"["$pink"03"$white"] Change secondary language"$pink"      "$white"["$pink"99"$white"] "$pink"Exit"$white"\n\n"
read -p '--> ' option

if [[ $option == 1 || $option == 01 ]]; then
printf "\n\n"
python3 python/translate.py

elif [[ $option == 2 || $option == 02 ]]; then
primMenu

elif [[ $option == 3 || $option == 03 ]]; then
secMenu

elif [[ $option == 99 ]]; then
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
menu
}
menu