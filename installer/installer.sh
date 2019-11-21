#!/bin/bash
red=`tput setaf 116`
ylw=`tput setaf 213`
pink=`tput setaf 212`
rnd=`tput setaf 208`
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
        
        
        
              ${pink}0x02a17dbf3d15962150e4efe8f74e2491d733629f${rs}
                                                                          
EOF
)

echo "${rnd}Installing to ${pink}/home/"$USER"/${rs}"

# --------------------------------------
printf "\n\n\n\n"

echo "${rnd}Getting dotfilez${rs}"
git clone https://github.com/koutsie/dotfilez.git
cd dotfilez

# --------------------------------------
printf "\n\n\n\n"

echo "${rnd}Baking a special cake, just for ${pink}$USER${rs}"
sed -i "s/koutsie/$USER/g" sowm/config.def.h
sed -i "s/koutsie/$USER/g" sowm.desktop

# --------------------------------------
printf "\n\n\n\n"

echo "${rnd}Making directories${rs}"
mkdir /home/"$USER"/Wallpapers
echo "${rnd}New dir: ${ylw}Wallpapers${rs}"

mkdir /home/"$USER"/Scripts
echo "${rnd}New dir: ${ylw}Scripts${rs}"

mkdir /home/"$USER"/Scripts/poly
echo "${rnd}New dir: ${ylw}Scripts/poly${rs}"

mkdir /home/"$USER"/.config/polybar
echo "${rnd}New dir: ${ylw}.config/polybar${rs}"

mkdir /home/"$USER"/dunst
echo "${rnd}New dir ${ylw}.config/dunst${rs}"


# --------------------------------------
printf "\n\n\n\n"

echo "${rnd}Copying configs and scripts${rs}"
cp -r --verbose config/polybar/* /home/"$USER"/.config/
cp -r --verbose config/dunst/* /home/"$USER"/.config/
cp -r --verbose config/neofetch/* /home/"$USER"/.config/
cp -r --verbose config/i3/ /home/"$USER"/.config/

cp -r --verbose Scripts/ /home/"$USER"/
cp -r --verbose Scripts/poly/ /home/"$USER"/Scripts/

chmod +x /home/"$USER"/Scripts/*
chmod +x /home/"$USER"/Scripts/poly/*

echo "${rnd}Adding bashrcs${rs}"
cp --verbose .bashrc /home/"$USER"/.bashrc

cp --verbose .bashrc_aliases /home/"$USER"/.bashrc_aliases

cp --verbose .bashrc_user /home/"$USER"/.bashrc_user

# --------------------------------------
printf "\n\n\n\n"

# sowm stuff
echo "${rnd}getting, compiling and installing ${pink}sowm${rs}"
git clone https://github.com/dylanaraps/sowm sowm_source 
cp --verbose sowm/config.def.h sowm_source/config.def.h
cd sowm_source && make -B && sudo make install && cd ..

sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop

# --------------------------------------
printf "\n\n\n\n"

echo "$donate"
