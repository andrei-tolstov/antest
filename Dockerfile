# vim: set ft=dockerfile:
ARG CENTOS_VERSION
FROM docker.io/centos:$CENTOS_VERSION

WORKDIR /root

ARG PYTHON_VERSION

# hadolint ignore=DL3033
RUN set -eux; \
    yum -y update; \
    yum -y install epel-release; \
    yum -y install \
	bash-completion \
	iproute \
	openssh-server \
	python$PYTHON_VERSION \
	sudo \
	tcping \
	; \
    yum -y clean all

RUN set -eux; \
    ssh-keygen -A; \
    sed -i -r 's/^.*Port 22.*$/Port 2222/' /etc/ssh/sshd_config; \
    systemctl enable sshd.service; \
    useradd -mG wheel ansible; \
    mkdir -m 0700 /home/ansible/.ssh; \
    chown ansible:ansible /home/ansible/.ssh; \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

COPY --chown=ansible:ansible id_ed25519.pub /home/ansible/.ssh/authorized_keys

RUN set -eux; \
    chmod 0600 /home/ansible/.ssh/authorized_keys

CMD ["/sbin/init"]

