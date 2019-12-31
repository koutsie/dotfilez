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
                                                                          
                                                                                                    
        ${bold}dontations not accepted currently${rs}          
        
        
        
              ${pink}no${rs}
                                                                          
EOF
)

echo "${rnd}Installing to ${pink}/home/"$USER"/${rs}"

# --------------------------------------
printf "\n\n"

echo "${rnd}Getting dotfilez${rs}"
git clone https://github.com/koutsie/dotfilez.git &> dotz.log
cd dotfilez

# --------------------------------------
printf "\n\n"

echo "${rnd}Baking a special cake, just for ${pink}$USER${rs}"
sed -i "s/koutsie/$USER/g" sowm/config.def.h
sed -i "s/koutsie/$USER/g" sowm.desktop

# --------------------------------------
printf "\n\n"

echo "${rnd}Making directories${rs}"
mkdir /home/"$USER"/Wallpapers &> dotz.log
echo "${rnd}New dir: ${ylw}Wallpapers${rs}"

mkdir /home/"$USER"/Scripts &> dotz.log
echo "${rnd}New dir: ${ylw}Scripts${rs}"

mkdir /home/"$USER"/Scripts/poly &> dotz.log
echo "${rnd}New dir: ${ylw}Scripts/poly${rs}"

mkdir /home/"$USER"/.config/polybar &> dotz.log
echo "${rnd}New dir: ${ylw}.config/polybar${rs}"

mkdir /home/"$USER"/.config/dunst &> dotz.log
echo "${rnd}New dir ${ylw}.config/dunst${rs}"


# --------------------------------------
printf "\n\n"

echo "${rnd}Copying configs and scripts${rs}"
cp -r config/polybar /home/"$USER"/.config/ &> dotz.log
cp -r config/dunst /home/"$USER"/.config/ &> dotz.log
cp -r config/neofetch /home/"$USER"/.config/ &> dotz.log
cp -r config/i3 /home/"$USER"/.config/ &> dotz.log

cp -r Scripts/ /home/"$USER"/ &> dotz.log
cp -r Scripts/poly/ /home/"$USER"/Scripts/ &> dotz.log

chmod +x /home/"$USER"/Scripts/*
chmod +x /home/"$USER"/Scripts/poly/*

echo "${rnd}Adding bashrcs${rs}"
cp .bashrc /home/"$USER"/.bashrc &> dotz.log

cp .bashrc_aliases /home/"$USER"/.bashrc_aliases &> dotz.log

cp .bashrc_user /home/"$USER"/.bashrc_user &> dotz.log

# --------------------------------------
printf "\n\n"

# sowm stuff
echo "${rnd}getting, compiling and installing ${pink}sowm${rs}"
git clone https://github.com/dylanaraps/sowm sowm_source &> dotz.log
cp --verbose sowm/config.def.h sowm_source/config.def.h &> dotz.log
cd sowm_source && make -B && sudo make install && cd .. &> dotz.log

sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop &> dotz.log

# --------------------------------------
printf "\n\n"

echo "$donate"
