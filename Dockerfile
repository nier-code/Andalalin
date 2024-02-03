FROM centos:7

ENV SIAB_USERCSS="Colors:+/usr/share/shellinabox/color.css,Normal:-/usr/share/shellinabox/white-on-black.css,Monochrome:-/usr/share/shellinabox/monochrome.css" \
    SIAB_PORT=4200 \
    SIAB_ADDUSER=true \
    SIAB_USER=root \
    SIAB_USERID=1000 \
    SIAB_GROUP=root \
    SIAB_GROUPID=1000 \
    SIAB_PASSWORD=root \
    SIAB_SHELL=/bin/bash \
    SIAB_HOME=/home/root \
    SIAB_SUDO=false \
    SIAB_SSL=true \
    SIAB_SERVICE=/:LOGIN \
    SIAB_PKGS=none \
    SIAB_PKGS2=none \
    SIAB_SCRIPT=none

RUN yum install -y epel-release && \
    yum install -y openssh-clients sudo shellinabox && \
    yum clean all && \
    rm -rf /var/cache/yum

EXPOSE 4200

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["shellinabox"]
