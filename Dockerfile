FROM node:6.10.2-alpine

RUN apk --update add openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && rm -rf /var/cache/apk/*

COPY rootfs /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]