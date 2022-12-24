ruta=$(pwd)

# Instalando dependencias de Entorno

sudo apt install -y mugshot xfce4-terminal

# Creando la carpeta para los temas

mkdir ~/.themes 
cp -r $ruta/Components/GTK-XFWM-Everblush-Theme/Everblush ~/.Themes/ 
cp -r $ruta/Components/GTK-XFWM-Everblush-Theme/Everblush-xfwm ~/.Themes/

mkdir mkdir ~/.local/share/icons
cp -r $ruta/Components/Nordzy-cyan-dark-MOD ~/.local/share/icons 

# Importando cursores

git clone https://github.com/alvatip/Radioactive-nord.git 
cd Radioactive-nord 
chmod +x install.sh 
./install.sh
echo "cursores instalados"

#----------------------------------------------------------------------------------------------------
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
#----------------------------------------------------------------------------------------------------
# Picom config

sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson

sudo cp -r $ruta/Components/picom-config/picom.conf ~/.config/

# Creando carpeta de Reposistorios
cd $ruta
mkdir $ruta/github

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

sudo apt install xfce4-dev-tools libstartup-notification0-dev libwnck-3-dev libxfce4ui-2-dev libxfce4panel-2.0-dev 
cd $ruta/github
git clone https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin.git && cd xfce4-docklike-plugin
./autogen.sh --prefix=/usr/local
make
sudo make install 
sudo cp src/docklike.desktop /usr/share/xfce4/panel/plugins
sudo cp src/.libs/libdocklike.so /usr/lib/x86_64-linux-gnu/xfce4/panel/plugins/
sudo cp src/libdocklike.la /usr/lib/x86_64-linux-gnu/xfce4/panel/plugins/

# EWW widget

cd $ruta
sudo apt install alsa-utils brightnessctl jq playerctl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
git clone https://github.com/elkowar/eww 
cd eww
cargo build --release 
sudo mv target/release/eww /usr/bin

sudo cp $ruta/Components/eww ~/.config/

# Findex

sudo apt install libkeybinder-3.0-dev
cd $ruta
git clone https://github.com/mdgaziur/findex.git
cd findex
./installer.sh

# i3lock

sudo apt install i3lock-color
cd $ruta
sudo cp -R $ruta/Components/i3lock-color-everblush/i3lock-everblush /usr/bin
xfconf-query --create -c xfce4-session -p /general/LockCommand -t string -s "i3lock-everblush"

# Neofetch

sudo cp -R $ruta/Components/Neofetch ~/.config/


# Final steps (Manual Setings)
echo "AVISO 1 Abre el archivo ManualSteps.txt y sigue los pasos"

sleep 10

echo "AVISO 2 Abre el archivo ManualSteps.txt y sigue los pasos"

sleep 10

echo "AVISO 3 Abre el archivo ManualSteps.txt y sigue los pasos"

sleep 10

xfce4-panel &

cat ManualSteps.txt 




