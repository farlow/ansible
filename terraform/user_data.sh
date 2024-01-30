#!/bin/bash
sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo service sshd restart

username=${user_name}
password=${user_password}

sudo adduser --gecos "" --disabled-password $username
sudo chpasswd <<<"$username:$password"
sudo usermod -aG sudo $username