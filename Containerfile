FROM quay.io/centos/centos:stream9

RUN dnf -y install \
    telnet \
    expect \
    openssh-server

COPY telnet.sh /usr/bin/telnet.sh
COPY sshd.sh /usr/bin/sshd.sh
ENTRYPOINT ["sshd.sh"]