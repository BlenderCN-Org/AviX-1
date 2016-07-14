# Remover PinguyBuilder
sudo apt-get autoremove --purge -y pinguybuilder
sudo apt-get autoremove --purge -y
sudo sed -i 's/bash \/opt\/config\/remove-pinguybuilder.sh/ /g' /etc/rc.local
sudo rm /opt/config/remove-pinguybuilder.sh