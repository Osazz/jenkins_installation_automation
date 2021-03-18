#!/bin/bash

# Install Java on the system
sudo yum -y install java-1.8.0-openjdk wget
java -version
# Install Jenkins
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
cd /etc/yum.repos.d/
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum -y install jenkins
# Start and Enable Jenkins server
sudo systemctl start jenkins
sudo systemctl enable jenkins
systemctl status jenkins
# Install firewalld on the server
sudo dnf install firewalld
sudo systemctl enable firewalld --now
sudo firewall-cmd --state
# Allow communication on port 8080
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
