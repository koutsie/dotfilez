#!/bin/bash
echo "██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗";
echo "██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝╚══███╔╝";
echo "██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗    ███╔╝ ";
echo "██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝   ███╔╝  ";
echo "██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████╗";
echo "╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝";
echo "                                                             ";


echo installing to /home/"$USER"/

echo getting dotfilez
git clone https://github.com/koutsie/dotfilez.git

echo entering directory dotfilez
cd dotfilez

echo making directories
mkdir /home/"$USER"/Wallpapers
echo New dir: Wallpapers
mkdir /home/"$USER"/Scripts
echo New dir: Scripts
mkdir /home/"$USER"/.config/i3
echo New dir: .config/i3
mkdir /home/"$USER"/.config/neofetch
echo New dir: .config/neofetch

echo copying configs
cp config/i3/config /home/"$USER"/.config/i3
cp config/neofetch/config.conf /home/"$USER"/.config/neofetch

echo copying scripts
cp --verbose Scripts/* /home/"$USER"/Scripts


echo adding bashrc
cp --verbose .bashrc /home/"$USER"/.bashrc

cp --verbose .bashrc_aliases /home/"$USER"/.bashrc_aliases

cp --verbose .bashrc_user /home/"$USER"/.bashrc_user




# sowm stuff
echo getting sowm
git clone https://github.com/dylanaraps/sowm sowm_source 
cp --verbose sowm/config.def.h sowm_source/config.def.h
echo entered direcotry sowm_source && cd sowm_source && make && sudo make clean install && cd .. && echo backing up from sowm_source

sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop


