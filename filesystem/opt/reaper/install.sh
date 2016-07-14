#/bin/bash
# REAPER
#!/bin/bash
zenity --question \
	   --title=REAPER \
	   --text=Você\ deseja\ instalar\ o\ REAPER? \
	   --ok-label=Sim \
	   --cancel-label=Não

case $? in
0)
# Install
zenity \
	--info \
    --title="Instalação do REAPER" \
   	--text="
Iniciando a instalação do REAPER, apenas aguarde, esse procedimento poderá levar alguns minutos...
" \
	--icon-name=zeroinstall \
	--timeout=15 \
	--no-wrap;
(
echo "# Instalando..."
echo "5";sleep 0.2
rm -r -v ~/.wine/drive_c/Program\ Files/REAPER*
wine /opt/reaper/installers/reaper*_x64-install.exe /S;
sleep 5
rm -v ~/Desktop/REAPER\ \(x64\).desktop;
sleep 5
rm -v ~/Área\ de\ Trabalho/REAPER\ \(x64\).desktop;
echo "10";sleep 0.2
# MIME
gksu -- bash -c 'chown $USER /opt/reaper';
mkdir -p ~/.local/share/applications/reaper/;
cp -R -v /opt/reaper/launchers/*.desktop ~/.local/share/applications/reaper/;
ln -s -v ~/.wine /opt/reaper/;
ln -s -v ~/.wine/drive_c/Program\ Files/REAPER\ \(x64\)/ ~/.wine/drive_c/Program\ Files/REAPER;
echo "20";sleep 0.2
xdg-mime default reaper.desktop application/x-wine-extension-rpp application/x-wine-extension-rpp-back application/x-wine-extension-reaperthemezip;
xdg-mime query default application/x-wine-extension-rpp;
echo "30";sleep 0.2
# REAPER SWS
wine /opt/reaper/installers/sws-v*-x64-install.exe /S;
echo "40";sleep 0.2
# REAPER codecs
# FFMPEG
cd /tmp;
echo "50";sleep 0.2
rm -r -v /tmp/ffmpeg*
7z x /opt/reaper/installers/ffmpeg-1.2-win64-shared.7z;
echo "60";sleep 0.2
cp -v /tmp/ffmpeg-1.2-win64-shared/bin/*.dll ~/.wine/drive_c/Program\ Files/REAPER\ \(x64\)/;
# LAME
cd /tmp;
mkdir -p -v ~/.wine/drive_c/users/$USER/Application\ Data/REAPER/UserPlugins;
cp -v /opt/reaper/installers/lame_enc64.dll ~/.wine/drive_c/users/$USER/Application\ Data/REAPER/UserPlugins/;
echo "70";sleep 0.2
echo "# Configurando..."
# VST plugins
ln -s ~/Plugins\ VST/ ~/.wine/drive_c/Program\ Files/REAPER\ \(x64\)/Plugins/FX/;
echo "80";sleep 0.2
# WINEASIO register
regsvr32 wineasio.dll;
wine64 regsvr32 wineasio.dll;
echo "90";sleep 0.2
# WINE as default
xdg-mime default wine.desktop application/x-ms-dos-executable;
xdg-mime query default application/x-ms-dos-executable;
rm -r -v ~/.local/share/applications/wine*.desktop
rm -r -v ~/.local/share/applications/install.desktop
echo "# Instalação concluída!"
echo "100";sleep 0.2
 )|
zenity \
	--progress \
    --title="Instalação do REAPER" \
    --no-cancel \
	--width=400 \
	--height=50;
rm -r ~/.wine/drive_c/*.rgt;
rm -r ~/.config/autostart/install.desktop
;;
1)
rm -r ~/.config/autostart/install.desktop
;;
-1)
echo "Aconteceu um erro inesperado."
zenity --info --text=Aconteceu\ um\ erro\ inesperado\.
;;
esac