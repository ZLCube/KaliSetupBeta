#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Instalando dependencias de Entorno

sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install -y cmatrix
sudo apt install -y mugshot xfce4-terminal

# Creando la carpeta para los temas

mkdir ~/.themes 
cp -r $ruta/Components/GTK-XFWM-Everblush-Theme/Everblush ~/.themes/ 
cp -r $ruta/Components/GTK-XFWM-Everblush-Theme/Everblush-xfwm ~/.themes/

# Configurando iconos

mkdir ~/.local/share/icons
cp -r $ruta/Components/Nordzy-cyan-dark-MOD ~/.local/share/icons 

# Importando cursores

git clone https://github.com/alvatip/Radioactive-nord.git 
cd Radioactive-nord 
chmod +x install.sh 
./install.sh
echo "cursores instalados"
cd ~/KaliSetup

# Instalamos paquetes adionales

sudo apt install -y kitty feh scrot scrub rofi xclip bat locate ranger wmname acpi sxhkd imagemagick

# Creando carpeta de Reposistorios

cd $ruta
mkdir $ruta/github

# Dependencias de Picom

sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

cd $ruta/github/
git clone https://github.com/ibhagwan/picom.git

# Instalando Picom
cd $ruta/github/picom

git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

sudo cp -r $ruta/Components/picom-config/picom.conf ~/.config/

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# Configuramos el tema Nord de Rofi:

mkdir -p ~/.config/rofi/themes
cp $ruta/rofi/nord.rasi ~/.config/rofi/themes/

# Instando lsd

sudo dpkg -i $ruta/lsd.deb

# Instalamos las HackNerdFonts

sudo cp -v $ruta/fonts/HNF/* /usr/local/share/fonts/

# Instalando Wallpaper de S4vitar

mkdir ~/Wallpaper
cp -v $ruta/Wallpaper/* ~/Wallpaper
mkdir ~/ScreenShots

# Copiando Archivos de Configuración

cp -rv $ruta/Config/* ~/.config/
sudo cp -rv $ruta/kitty /opt/

# Copia de configuracion de .p10k.zsh y .zshrc

rm -rf ~/.zshrc
cp -v $ruta/.zshrc ~/.zshrc

cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/.p10k.zsh-root /root/.p10k.zsh

# Script

sudo cp -v $ruta/scripts/whichSystem.py /usr/local/bin/
sudo cp -v $ruta/scripts/screenshot /usr/local/bin/

# Plugins ZSH

sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Cambiando de SHELL a zsh

sudo ln -s -fv ~/.zshrc /root/.zshrc

# Asignamos Permisos a los Scritps

chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/htb_target.sh
chmod +x ~/.config/polybar/launch.sh
sudo chmod +x /usr/local/bin/whichSystem.py
sudo chmod +x /usr/local/bin/screenshot

#Installing fonts 

cp -r $ruta/Components/fonts ~/.local/share

#Installing Kvantum themes

sudo apt install -y qt5-style-kvantum qt5-style-kvantum-themes

cp -r $ruta/Components/Kvantum ~/.config

# Wallpaper folder

cp -r $ruta/Components/wallpapers ~/.local/share

# Lightdm login manager 

cd ~/.themes 
sudo cp -R Everblush /usr/share/themes/

cd ~/.local/share/icons
sudo cp -Rv Nordzy-cyan-dark-MOD /usr/share/icons


# Descargar Repositorios Necesarios

cd $ruta/github
git clone https://github.com/yshui/picom.git
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd $ruta

# xfce4 setup

xfce4-panel --quit
pkill xfconfd
sudo cp -R $ruta/Components/home-config/.assets ~/
sudo mv ~/.profile ~/.profile-00
sudo cp -R $ruta/Components/home-config/.profile ~/
sudo cp -R $ruta/Components/home-config/.Xresources ~/
sudo cp -R $ruta/Components/gtk-3.0/gtk.css ~/.config/gtk-3.0/
sudo cp -R $ruta/Components/xfce4-config/genmon-scripts ~/
sudo mv ~/.config/xfce4 ~/.config/xfce4-00 
sudo cp -R $ruta/Components/xfce4-config/xfce4 ~/.config/

# Docklike-plugin

cd $ruta
chmod +x docklike.sh
./docklike.sh
cd $ruta

# Findex

sudo apt install -y libkeybinder-3.0-dev
cd $ruta
git clone https://github.com/mdgaziur/findex.git
cd findex
sudo ./installer.sh

# i3lock

sudo apt install -y i3lock-color
cd $ruta
sudo cp -R $ruta/Components/i3lock-color-everblush/i3lock-everblush /usr/bin
xfconf-query --create -c xfce4-session -p /general/LockCommand -t string -s "i3lock-everblush"

# Neofetch

sudo apt install -y neofetch
sudo rm -Rv ~/.config/neofetch
sudo cp -R $ruta/Components/neofetch ~/.config/

# EWW widget

sudo apt install -y alsa-utils brightnessctl jq playerctl
cd $ruta
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
git clone https://github.com/elkowar/eww 
cd eww
cargo build --release 
sudo mv target/release/eww /usr/bin
sudo cp -R $ruta/Components/eww ~/.config/

# Mensaje de Instalado

notify-send "Kali configurado"
sudo mv $ruta/ManualSteps.txt ~/


# Final steps (Manual Setings)
echo "AVISO 1 Abre el archivo ManualSteps.txt y sigue los pasos"
sleep 10
echo "AVISO 2 Abre el archivo ManualSteps.txt y sigue los pasos"
sleep 10
echo "AVISO 3 Abre el archivo ManualSteps.txt y sigue los pasos"
sleep 10

xfce4-panel &

cat ~/ManualSteps.txt 


echo "La maquina se reiniciara en 30 segundos"
sleep 30 

kill -9 -1 
