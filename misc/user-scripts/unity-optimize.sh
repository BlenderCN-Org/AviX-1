#!/bin/bash
sudo apt-get install -y --reinstall mesa-utils zram-config
sudo mkdir -p /etc/X11/xorg.conf.d/
wget -O- http://avix.sf.net/scripts/apps/private/20-intel.conf|tee /etc/X11/xorg.conf/20-intel.conf
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ low_graphics_mode false
gsettings get org.compiz.core:/org/compiz/profiles/unity/plugins/core/ active-plugins >> /tmp/plugins
sed -i "s/ 'animation',//g" /tmp/plugins
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ active-plugins "`cat /tmp/plugins`"