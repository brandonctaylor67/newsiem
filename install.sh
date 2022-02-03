#!/bin/bash


mkdir /home/docker/
cd /home/docker/
wget https://github.com/brandonctaylor67/newsiem/raw/main/siem.zip
sudo unzip siem.zip
rm siem.zip

chmod -R 7777 /home/docker/siem/grafana/

cd /home/docker/siem/pfstack/
docker-compose up -d

cd /home/docker/siem/wazuh-docker/
docker-compose up -d

echo 'sleeping for 2m 30s.'
sleep 2m 30s

cd /home/docker/siem/kibana-templates/
chmod +x pfelk-dashboard-installer.sh
chmod +x pfelk-template-installer.sh
sudo ./pfelk-template-installer.sh
sudo ./pfelk-dashboard-installer.sh
