#!/bin/bash
echo "Bitte die Hinweise im Git-Repository beachten!"
sudo apt update -y;
sudo apt install -y needrestart;
sed -i s/"#\$nrconf{restart} = 'i';"/"\$nrconf{restart} = 'a';"/g /etc/needrestart/needrestart.conf;
sed -i s/"#\$nrconf{kernelhints} = -1;"/"\$nrconf{kernelhints} = 0;"/g /etc/needrestart/needrestart.conf;
sudo apt upgrade -y;
sudo apt install -y git;
sudo apt install -y nginx;
sudo apt install -y python3;
sudo apt install -y certbot;
sudo apt install -y python3-certbot-nginx;
sudo apt install -y ruby;
sudo apt install -y default-jdk;
sudo apt install -y default-jre;
sudo apt install -y python3-pip;
sudo apt install -y net-tools;
sudo apt install -y docker.io;
sudo apt install -y nodejs;
pip install flask;
git clone https://github.com/istichel/Infrastruktur-Einrichtung.git;
sudo crontab -l > mycron;
echo "00 03 * * 0 certbot renew" >> mycron;
sudo crontab mycron;
rm mycron;
sudo apt install ssh;
echo "Match group sftp" >> /etc/nginx/sites-enabled/$subdomain;
echo "ChrootDirectory /home" >> /etc/nginx/sites-enabled/$subdomain;
echo "X11Forwarding no" >> /etc/nginx/sites-enabled/$subdomain;
echo "AllowTcpForwarding no" >> /etc/nginx/sites-enabled/$subdomain;
echo "ForceCommand internal-sftp" >> /etc/nginx/sites-enabled/$subdomain;
systemctl restart ssh;
sudo addgroup sftp;
sudo shutdown -r now;
