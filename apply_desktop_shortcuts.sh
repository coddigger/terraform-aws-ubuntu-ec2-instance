#! /bin/bash

# Pre-requisite: Log in as student1 and add "Mate Terminal", "Postman" and "VScode" to Favorites and Desktop Shortcut

for i in {2..16}; do
  sudo mkdir -pv /home/student$i/Desktop;
  sudo cp /home/student1/Desktop/* /home/student$i/Desktop;
  sudo chown student$i:student$i /home/student$i/Desktop/*;
done