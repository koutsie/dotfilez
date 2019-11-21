#!/bin/bash
red=`tput setaf 116`
ylw=`tput setaf 213`
ond=`tput setaf 212`
bold=`tput bold`
rs=`tput sgr0`

donate=$(cat << EOF
       ${ylw}██████╗  ██████╗ ████████╗${red}███████╗██╗██╗     ███████╗███████╗${rs}
       ${ylw}██╔══██╗██╔═══██╗╚══██╔══╝${red}██╔════╝██║██║     ██╔════╝╚══███╔╝${rs}
       ${ylw}██║  ██║██║   ██║   ██║   ${red}█████╗  ██║██║     █████╗    ███╔╝ ${rs}
       ${ylw}██║  ██║██║   ██║   ██║   ${red}██╔══╝  ██║██║     ██╔══╝   ███╔╝  ${rs}
       ${ylw}██████╔╝╚██████╔╝   ██║   ${red}██║     ██║███████╗███████╗███████╗${rs}
       ${ylw}╚═════╝  ╚═════╝    ╚═╝   ${red}╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝${rs}
                                  Donate?
                                                                          
                                                                                                    
        ${bold}##############  ##          ######      ##  ##############        
        ##          ##  ##    ######  ##  ######    ##          ##        
        ##  ######  ##  ####    ####      ######    ##  ######  ##        
        ##  ######  ##  ######  ########      ##    ##  ######  ##        
        ##  ######  ##    ####  ##  ##  ######  ##  ##  ######  ##        
        ##          ##  ######      ####    ####    ##          ##        
        ##############  ##  ##  ##  ##  ##  ##  ##  ##############        
                            ####  ##  ####  ####                          
        ####    ######      ##  ######        ####    ##  ########        
        ##    ##  ##  ####        ####      ##  ####    ##########        
        ####  ####  ####  ####          ##    ##########    ######        
        ##    ##  ##  ##  ##    ##    ########    ####    ##  ####        
                ##  ######    ##    ##    ####  ##        ##              
            ##  ##      ######  ##  ####        ##  ##############        
        ##        ####        ####  ####  ##    ######  ####  ####        
        ##  ####      ##    ####  ##    ##  ####  ######      ####        
        ####        ####    ##  ####  ##  ####      ####        ##        
        ############        ##    ####    ##      ##    ##########        
              ##  ######                  ##          ######    ##        
            ########  ##  ####  ##    ####  ##                ####        
        ######    ######      ##  ######  ################                
                        ####    ##  ##  ##  ######      ##  ######        
        ##############    ############        ####  ##  ##########        
        ##          ##  ##    ##  ##  ########  ##      ####  ####        
        ##  ######  ##  ####    ####      ##################  ####        
        ##  ######  ##    ##      ######  ####  ##  ##      ##            
        ##  ######  ##      ##            ##    ##  ##        ####        
        ##          ##  ####    ##  ######  ####  ##  ######  ####        
        ##############  ####  ##  ####  ##  ##  ######  ####  ##${rs}          
        
        
        
              ${ond}${pink}0x02a17dbf3d15962150e4efe8f74e2491d733629f${rs}
                                                                          
                                                                          
EOF)

echo installing to /home/"$USER"/

# --------------------------------------
printf "\n\n\n\n"

echo getting dotfilez
git clone https://github.com/koutsie/dotfilez.git
cd dotfilez

# --------------------------------------
printf "\n\n\n\n"

echo "Baking a special cake, just for $USER"
sed -i "s/koutsie/$USER/g" sowm/config.def.h
sed -i "s/koutsie/$USER/g" sowm.desktop

# --------------------------------------
printf "\n\n\n\n"

echo "making directories"
mkdir /home/"$USER"/Wallpapers
echo "New dir: Wallpapers"

mkdir /home/"$USER"/Scripts
echo "New dir: Scripts"

mkdir /home/"$USER"/Scripts/poly
echo "New dir: Scripts/poly"

mkdir /home/"$USER"/.config/polybar
echo "New dir: .config/polybar"

mkdir /home/"$USER"/dunst
echo "New dir .config/dunst"


# --------------------------------------
printf "\n\n\n\n"

echo "copying configs and scripts"
cp --verbose config/poly/* /home/"$USER"/.config/polybar
cp --verbose config/dunst/* /home/"$USER"/.config/dunst


cp --verbose Scripts/* /home/"$USER"/Scripts
cp --verbose Scripts/poly* /home/"$USER"/Scripts/poly
chmod +x /home/"$USER"/Scripts/*
chmod +x /home/"$USER"/Scripts/poly/*

echo "adding bashrcs"
cp --verbose .bashrc /home/"$USER"/.bashrc

cp --verbose .bashrc_aliases /home/"$USER"/.bashrc_aliases

cp --verbose .bashrc_user /home/"$USER"/.bashrc_user

# --------------------------------------
printf "\n\n\n\n"

# sowm stuff
echo "getting sowm"
git clone https://github.com/dylanaraps/sowm sowm_source 
cp --verbose sowm/config.def.h sowm_source/config.def.h
cd sowm_source && make -B && sudo make install && cd ..

sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop

# --------------------------------------
printf "\n\n\n\n"

echo "$donate"
