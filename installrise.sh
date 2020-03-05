#!/usr/bin/screen -d -m -S prepare /bin/bash
TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
GREEN='\033[0;32m'

echo && echo
echo -e "${GREEN}██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗"
echo -e "${GREEN}██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝"
echo -e "${GREEN}██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  "
echo -e "${GREEN}██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  "
echo -e "${GREEN}╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗"
echo -e "${GREEN} ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝"
echo -e "${NC}                                                                  "
echo && echo && echo

echo -e $GREEN
echo 'This Script Will Install Rise'
echo -e $TEXT_RESET
echo -e $TEXT_YELLOW
read -p "Press enter to continue"
echo -e $TEXT_RESET

clear

echo 'Installing with latest snapshot'
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
clear
echo 'step 1 of 4'
wget https://raw.githubusercontent.com/RiseVision/rise-build/master/scripts/install.sh > /dev/null 2>&1
sleep 3
clear
echo 'step 2 of 4'
yes | bash install.sh install -r mainnet -u https://downloads.rise.vision/core/mainnet/latest.tar.gz
sleep 3
clear
echo 'step 3 of 4'
cd rise
sleep 1
rm latestsnap.gz > /dev/null 2>&1
sleep 3
clear
echo 'step 4 of 4 , restore snapshot will take some minutes'
wget https://downloads.rise.vision/snapshots/mainnet/latest -O latestsnap.gz > /dev/null 2>&1
./manager.sh restoreBackup latestsnap.gz > /dev/null 2>&1
sleep 3
clear
echo -e $GREEN
echo 'Install Complete'
echo -e $TEXT_RESET
sleep 3
./manager.sh status
sleep 5
clear
echo -e $TEXT_YELLOW
echo 'Now you can add yoor passphrase'
clear
read -p "Press enter to add yoor passphrase after that do ./manager.sh reload node"
echo -e $TEXT_RESET
clear
cd
rm -rf installrise.sh > /dev/null
nano  /home/$USER/rise/etc/node_config.json
