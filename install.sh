#!/bin/sh
sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y
sudo service nginx start
sudo service nginx status

