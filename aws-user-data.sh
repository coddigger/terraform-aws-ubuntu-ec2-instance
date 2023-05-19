#! /bin/bash

#############################
# CHECK TO SEE NETWORK IS READY
#############################
count=0
while true
do
  STATUS=$(curl -s -k -I https://github.com | grep HTTP)
  if [[ $STATUS == *"200"* ]]; then
    echo "internet access check passed"
    break
  elif [ $count -le 360 ]; then
    echo "Status code: $STATUS  Not done yet..."
    count=$[$count+1]
  else
    echo "GIVE UP..."
    break
  fi
  sleep 10
done
sudo apt-get update
sudo apt install -y net-tools nmap

# VSCode
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Postman
sudo snap install postman

# Ansible
sudo apt install -y ansible

# Ubuntu Desktop
#sudo apt install -y lightdm ubuntu-mate-desktop xrdp
#sudo systemctl enable lightdm
#sudo systemctl enable xrdp

sudo apt -y autoremove

#############################
# CREATE LOCAL USERS
#############################

for i in {1..12}; do
  echo "Creating student$i"
  sudo useradd -m -d /home/student$i -s /bin/bash student$i;
done

#S3A*5Rr#ALCEfw


