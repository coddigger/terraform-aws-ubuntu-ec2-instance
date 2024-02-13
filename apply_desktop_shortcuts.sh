#! /bin/bash

# Pre-requisite: Log in as user "ubuntu" and add "Mate Terminal", "Postman" and "VScode" to Desktop Shortcuts

for i in {1..16}; do
  sudo mkdir -pv /home/student$i/Desktop;
  sudo cp /home/ubuntu/Desktop/* /home/student$i/Desktop;
  sudo chown student$i:student$i /home/student$i/Desktop/*;
done