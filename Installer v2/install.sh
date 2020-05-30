#!/bin/bash
red=`tput setaf 116`
orange=`tput setaf 213`
pink=`tput setaf 212`
rnd=`tput setaf 208`
ylw=`tput setaf 12`
orange=`tput setaf 142`
bold=`tput bold`
rs=`tput sgr0`

donate=$(cat << EOF
       ${orange}██████╗  ██████╗ ████████╗${red}███████╗██╗██╗     ███████╗███████╗${rs}
       ${orange}██╔══██╗██╔═══██╗╚══██╔══╝${red}██╔════╝██║██║     ██╔════╝╚══███╔╝${rs}
       ${orange}██║  ██║██║   ██║   ██║   ${red}█████╗  ██║██║     █████╗    ███╔╝ ${rs}
       ${orange}██║  ██║██║   ██║   ██║   ${red}██╔══╝  ██║██║     ██╔══╝   ███╔╝  ${rs}
       ${orange}██████╔╝╚██████╔╝   ██║   ${red}██║     ██║███████╗███████╗███████╗${rs}
       ${orange}╚═════╝  ╚═════╝    ╚═╝   ${red}╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝${rs}
                                  Donate?                                                                     
				${bold}Donate to a charity, if you can.${rs}          
						  ${rnd}thank you.${rs}
                                                                          
EOF
)

echo "${rnd}Installing to ${pink}/home/"$USER"/${rs}"
echo "${ylw}If you think something went wrong with the installation, see dotz.log${rs}"


# --------------------------------------
printf "\n\n"

echo "${rnd}Getting dotfilez${rs}"
git clone https://github.com/koutsie/dotfilez.git &> dotz.log
cd dotfilez
dotfilez=$(pwd)

# --------------------------------------
printf "\n\n"

echo "${rnd}Making install user specific: ${pink}[$USER]${rs}"
sed -i "s/koutsie/$USER/g" sowm/config.def.h
sed -i "s/koutsie/$USER/g" sowm.desktop

# --------------------------------------
printf "\n\n"

echo "${rnd}Making directories${rs}"	

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

echo "${rnd}Fixing permissions${rs}"
chmod +x /home/"$USER"/Scripts/*
chmod +x /home/"$USER"/Scripts/poly/*

echo "${rnd}Adding bashrcs${rs}"
cp .bashrc /home/"$USER"/.bashrc &> dotz.log
cp .bashrc_aliases /home/"$USER"/.bashrc_aliases &> dotz.log

cp .bashrc_user /home/"$USER"/.bashrc_user &> dotz.log

# --------------------------------------
printf "\n\n"

# sowm stuff
echo "${rnd}Installing ${orange}Shitty Opinionated Window Manager${rs}"

cd sowm

# getting the patches ma duud
echo "${rnd}Patching sowm${rs}"
patch -t < patches/58.patch  &> dotz.log
patch -t < patches/59.patch  &> dotz.log
patch -t < patches/70.patch  &> dotz.log

echo "${rnd}Building sowm${rs}"
make -B && sudo make install 

cd $dotfiles
sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop &> dotz.log
echo "${rnd}Done!${rs}"

# --------------------------------------
printf "\n\n"

echo "$donate"
