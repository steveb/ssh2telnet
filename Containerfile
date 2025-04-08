FROM quay.io/centos/centos:stream9

ARG user=user

RUN dnf -y install \
    telnet \
    expect \
    openssh-server && \
    useradd ${user}

USER ${user}

COPY telnet.sh /usr/bin/telnet.sh
COPY sshd.sh /usr/bin/sshd.sh
CMD /usr/bin/sshd.sh