#/bin/bash

mkdir dock
sudo apt install -y xfce4-dev-tools libstartup-notification0-dev libwnck-3-dev libxfce4ui-2-dev libxfce4panel-2.0-dev 
cd /dock
git clone https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin.git 
cd xfce4-docklike-plugin
sudo ./autogen.sh --prefix=/usr/local
sudo make
sudo make install 
sudo cp src/docklike.desktop /usr/share/xfce4/panel/plugins
sudo cp src/.libs/libdocklike.so /usr/lib/x86_64-linux-gnu/xfce4/panel/plugins/
sudo cp src/libdocklike.la /usr/lib/x86_64-linux-gnu/xfce4/panel/plugins/
