chmod +rx translate.sh
pink="\033[38;5;198m"
green="\033[1;32m"
white="\033[97m"

chromedriverfunc() {
printf '\n'
read -p "Do you already have an installed `printf "$green"`chromedriver`printf "$white"`? (Y/N)`echo $'\n\n--->'`" chdrsorgu
printf '\n'

if [[ $chdrsorgu == 'Y' || $chdrsorgu == 'y' ]]; then
chrdrVarFunc

elif [[ $chdrsorgu == 'N' || $chdrsorgu == 'n' ]]; then
chrdrYokFunc

else
printf '\nPlease enter a valid command.\n\n'
chromedriverfunc
fi
}

chrdrVarFunc() {
printf '\n'
read -p "Please enter the path of the `printf "$green"`chromedriver `printf "$white"`correctly. (for exmp: /root/blah/brah/chromedriver)`echo $'\n\n--->'`" chdrkonum
printf '\n'

if [[ $chdrkonum != '' ]]; then
> options/chr_drv_path.txt
echo $chdrkonum >> options/chr_drv_path.txt
sed -i '/^$/d' options/chr_drv_path.txt

else
printf '\n'$pink'Can not be blank, canceling...\n\n'
exit
fi
}

chrdrYokFunc() {
apt-get install npm
npm install chromedriver -g
node /usr/local/lib/node_modules/chromedriver/install.js
mv /usr/local/lib/node_modules/chromedriver/lib/chromedriver/chromedriver options
rm -r /usr/local/lib/node_modules/chromedriver
> options/chr_drv_path.txt
echo options/chromedriver >> options/chr_drv_path.txt
sed -i '/^$/d' options/chr_drv_path.txt
}
chromedriverfunc

apt install python3-pip
pip3 install -r requirements.txt