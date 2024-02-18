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
sudo apt install -y software-properties-common apt-transport-https wget
sudo apt install -y net-tools nmap

# VSCode
# already present in AMI
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Postman
sudo snap install postman

# Ansible
sudo apt install -y ansible

# Cleanup
sudo apt -y autoremove

# Suppress Ubuntu LTS upgrade messages
sudo sed -i 's/Prompt=lts/Prompt=never/' /etc/update-manager/release-upgrades