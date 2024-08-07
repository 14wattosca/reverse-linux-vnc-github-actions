#!/bin/bash
# Reverse Linux VNC for GitHub Actions by PANCHO7532
# This script is executed when GitHub actions is initialized.
# Prepares dependencies, ngrok, and vnc stuff

# First, install required packages...
sudo apt update
#sudo apt install -y net-tools curl xfce4 xfce4-goodies xfonts-base xubuntu-icon-theme xubuntu-wallpapers gnome-icon-theme x11-apps x11-common x11-session-utils x11-utils x11-xserver-utils x11-xkb-utils dbus-user-session dbus-x11 gnome-system-monitor gnome-control-center libpam0g libxt6 libxext6 novnc python3-websockify python3-numpy

# Second, install TurboVNC
# Fun Fact: TurboVNC is the only VNC implementations that supports OpenGL acceleration without an graphics device by default
# By the way, you can still use the legacy version of this script where instead of installing TurboVNC, tightvncserver is installed.
# Old mirror: wget https://ufpr.dl.sourceforge.net/project/turbovnc/2.2.5/turbovnc_2.2.5_amd64.deb
#wget https://phoenixnap.dl.sourceforge.net/project/turbovnc/2.2.5/turbovnc_2.2.5_amd64.deb
#sudo dpkg -i turbovnc_2.2.5_amd64.deb
wget https://github.com/ttalvitie/browservice/releases/download/v0.9.9.2/browservice-v0.9.9.2-x86_64.AppImage

# Third, download ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvf ngrok-v3-stable-linux-amd64.tgz
chmod +x ngrok

# Fourth, generate and copy passwd file and xstartup script
#export PATH=$PATH:/opt/TurboVNC/bin
#mkdir $HOME/.vnc
#cp ./resources/xstartup $HOME/.vnc/xstartup.turbovnc
#echo $VNC_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
#chmod 0600 $HOME/.vnc/passwd
#Start noVNC
#sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/novnc.pem -out /etc/ssl/novnc.pem -days 365
#sudo chmod 644 novnc.pem
#websockify -D --web=/usr/share/novnc/ --cert=/etc/ssl/novnc.pem 6080 localhost:5901
#sudo systemctl start xrdp
#sudo usermod --password $VNC_PASSWORD runner

# Fifth and last, set up auth token from argument
./ngrok authtoken $NGROK_AUTH_TOKEN
#echo "version: "\""2"\""
#authtoken: $NGROK_AUTH_TOKEN
#tunnels:
#  first:
#    addr: 6080
#    proto: tcp    
#  second:
#    addr: 7582
#    proto: tcp" > /home/runner/.config/ngrok/ngrok.yml
#exit
