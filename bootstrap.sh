#!/bin/bash

#-----------to update all the system software and their dependencies----------
yum update
touch /var/log/system-bootstrap.log
echo "System updated" >> /var/log/system-bootstrap.log

#-----configureaza interfetele de retea disponibile----------
service network restart
echo "Configured interfaces" >> /var/log/system-bootstrap.log 


#------configureaza procesul de SSH----disable password auth
#touch /etc/ssh/sshd_config_new
#cp /etc/ssh/sshd_config_new /etc/ssh/sshd_config
#modifica "PasswordAuthentication yes" --> no
echo "PasswordAuthentication disabled" >> /var/log/system-bootstrap.log
sed -r -i 's/(PasswordAuthentication yes)/PasswordAuthentication no/' /etc/ssh/sshd_config 

# "PermitRootLogin yes" --> no
sed -r -i 's/(PermitRootLogin yes)/PermitRootLogin no/' /etc/ssh/sshd_config
echo "Root login disabled">> /var/log/system-bootstrap.log

#restarteaza serviciul SSH pentru a lua in considerare noua configurare
sudo systemctl restart sshd
echo "SSH service restarted" >> /var/log/system-bootstrap.log

# ---------seteaza SELINUX=disbled------------
cp /etc/selinux/config_new_bkup /etc/selinux/config
sed -r -i 's/(SELINUX=enforcing)/SELINUX=disabled/' /etc/selinux/config
echo "SELINUX parameter set" >> /var/log/system-bootstrap.log

setenforce 0


