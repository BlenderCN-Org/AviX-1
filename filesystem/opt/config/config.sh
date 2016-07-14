#!/bin/bash
# Undistract-me
source ~/.bashrc
# Setar a pasta de Vídeos do usuário compartilhada por DLNA e SAMBA
rm -r -v ~/Vídeos;
gksu -- bash -c 'chown $USER /var/lib/minidlna/Videos;chmod 777 /var/lib/minidlna/Videos'
ln -s -v /var/lib/minidlna/Videos ~/Vídeos
# Otimizações do gerenciador de arquivos
dconf reset -f /org/gnome/nautilus
sleep 2
dconf reset -f /org/gnome/nautilus
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gnome.nautilus.preferences enable-interactive-search true
# Favoritos do gerenciador de arquivos
mkdir -p ~/.config/gtk-3.0
echo file:///home/$USER/.wine/dosdevices/c: Wine - Disco C:\\ | tee -a ~/.config/gtk-3.0/bookmarks
echo file:///media Armazenamento externo | tee -a ~/.config/gtk-3.0/bookmarks
# Setar o GPicView para abrir imagens
xdg-mime default gpicview.desktop image/jpeg
xdg-mime default gpicview.desktop image/jpg
xdg-mime default gpicview.desktop image/png
xdg-mime default gpicview.desktop image/gif
# Setar o GNOME MPlayer para abrir vídeos
xdg-mime default smplayer.desktop x-content/video-dvd
# Setar o Google Chrome para abrir PDF
xdg-mime default google-chrome.desktop application/pdf
# Remover atalho
rm -r ~/.config/autostart/config.desktop