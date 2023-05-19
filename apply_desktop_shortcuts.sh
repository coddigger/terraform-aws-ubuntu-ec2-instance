#! /bin/bash

for i in {1..12}; do
  sudo mkdir -pv /home/student$i/Desktop;
  sudo cp /home/student1/Desktop/* /home/student$i/Desktop;
done