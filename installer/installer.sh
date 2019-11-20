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

echo "Baking a special cake, just for $USER"
sed -i "s/koutsie/$USER/g" sowm/config.def.h
sed -i "s/koutsie/$USER/g" sowm.desktop

echo making directories
mkdir /home/"$USER"/Wallpapers
echo New dir: Wallpapers
mkdir /home/"$USER"/Scripts
echo New dir: Scripts

echo copying scripts
cp --verbose Scripts/* /home/"$USER"/Scripts


echo adding bashrc's
cp --verbose .bashrc /home/"$USER"/.bashrc

cp --verbose .bashrc_aliases /home/"$USER"/.bashrc_aliases

cp --verbose .bashrc_user /home/"$USER"/.bashrc_user




# sowm stuff
echo getting sowm
git clone https://github.com/dylanaraps/sowm sowm_source 
cp --verbose sowm/config.def.h sowm_source/config.def.h
cd sowm_source && make && sudo make install && cd ..

sudo cp --verbose sowm.desktop /usr/share/xsessions/sowm.desktop

