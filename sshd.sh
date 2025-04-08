#!/bin/bash

set -eu

cd $HOME
mkdir -p .ssh/etc/ssh
ssh-keygen -A -f .ssh

chmod -R 700 .ssh
touch .hushlogin

cat <<EOF >> .bashrc
export HOST=$HOST
export USERNAME=$USERNAME
export PASSWORD=$PASSWORD
telnet.sh
exit \$1
EOF

KEY=${KEY:-}
if [ -n "KEY" ] ; then
    echo $KEY > .ssh/authorized_keys
fi

cat <<EOF >> .ssh/sshd_config
Port 2222
HostKey $HOME/.ssh/etc/ssh/ssh_host_ed25519_key
PidFile $HOME/.ssh/sshd.pid
EOF
/usr/sbin/sshd -D -e -f .ssh/sshd_config