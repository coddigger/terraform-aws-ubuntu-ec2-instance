#! /bin/bash

# Assign password to all users
# Password is from the tf output variable "rds_password"

rds_password=random_password
filename=user.pw

for i in {1..16}; do
  echo "student$i:$rds_password" >> $filename;
done

#chpassword < $filename