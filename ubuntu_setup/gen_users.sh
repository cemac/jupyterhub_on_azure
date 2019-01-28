#!/bin/bash
# create users and empty users.txt
number_of_users=42
password_file=~/users.txt
touch $password_file
for i in `seq 1 $number_of_users`;
  do
  username=training_user$i
  sudo adduser --disabled-password --gecos "" $username
  sudo usermod -aG jupyterhub $username
  userpassword=`apg -n 1`
  echo $username:$userpassword | sudo chpasswd
  echo "UserID:" $username "has been created with the following password " $userpassword >> $password_file
done
echo "Created training users"
#Install the instructor username
sudo adduser --disabled-password --gecos "" instructor
sudo usermod -aG jupyterhub instructor
userpassword=`apg -n 1`
echo instructor:$userpassword | sudo chpasswd
echo "UserID:" instructor "has been created with the following password " $userpassword >> $password_file
echo "Created instructor"
