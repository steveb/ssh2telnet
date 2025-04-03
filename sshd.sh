#!/bin/bash

set -eu
ssh-keygen -A
useradd $USERNAME -p $PASSWORD
userssh=/home/$USERNAME/.ssh
mkdir $userssh
chmod 700 $userssh
chown $USERNAME:$USERNAME $userssh

touch /home/$USERNAME/.hushlogin
userbash=/home/$USERNAME/.bashrc
echo export HOST=$HOST >> $userbash
echo export USERNAME=$USERNAME >> $userbash
echo export PASSWORD=$PASSWORD >> $userbash
echo telnet.sh >> $userbash
echo exit \$1 >> $userbash

KEY=${KEY:-}
if [ -n "KEY" ] ; then
    echo $KEY > $userssh/authorized_keys
fi

/usr/sbin/sshd -D -e