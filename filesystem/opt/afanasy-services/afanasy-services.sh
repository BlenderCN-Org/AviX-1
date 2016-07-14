#!/bin/bash
zenity --question \
	   --title=Afanasy \
	   --text=Você\ deseja\ ativar\ ou\ desativar\ o\ servidor\ do\ Afanasy\? \
	   --ok-label=Ativar\ o\ servidor \
	   --cancel-label=Desativar\ o\ servidor

case $? in
0)
echo "Iniciando o servidor..."
gksu -- bash -c ' \
cp /opt/afanasy-services/afserver.service /etc/avahi/services/; \
update-rc.d afserver disable; \
update-rc.d afserver enable; \
/etc/init.d/afserver stop; \
/etc/init.d/afserver start; \
/etc/init.d/avahi-daemon restart'
zenity --info --text=Servidor\ ativado\ com\ sucesso\!
;;
1)
echo "Encerrando o servidor..."
gksu -- bash -c ' \
/etc/init.d/afserver stop; \
update-rc.d afserver disable; \
rm /etc/avahi/services/afserver.service; \
/etc/init.d/avahi-daemon restart'
zenity --info --text=Servidor\ desativado\ com\ sucesso\!
;;
-1)
echo "Aconteceu um erro inesperado."
zenity --info --text=Aconteceu\ um\ erro\ inesperado\.
;;
esac
zenity --question \
	   --title=Afanasy \
	   --text=Você\ deseja\ ativar\ ou\ desativar\ o\ renderizador\ do\ Afanasy\? \
	   --ok-label=Ativar\ o\ renderizador \
	   --cancel-label=Desativar\ o\ renderizador

case $? in
0)
echo "Iniciando o renderizador..."
gksu -- bash -c ' \
update-rc.d afrender disable; \
update-rc.d afrender enable; \
/etc/init.d/afrender stop; \
/etc/init.d/afrender start'
zenity --info --text=Renderizador\ ativado\ com\ sucesso\!
;;
1)
echo "Encerrando o renderizador..."
gksu -- bash -c ' \
/etc/init.d/afrender stop; \
update-rc.d afrender disable'
zenity --info --text=Renderizador\ desativado\ com\ sucesso\!
;;
-1)
echo "Aconteceu um erro inesperado."
zenity --info --text=Aconteceu\ um\ erro\ inesperado\.
;;
esac
