
FROM ubuntu:18.04

MAINTAINER Nate Fugal <info@natefugal.tech>

ENV TZ=America/Denver

RUN apt-get update && \
  apt-get install -y gpg software-properties-common
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu bionic main" \
  > /etc/apt/sources.list.d/nginx-stable.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
RUN add-apt-repository -y ppa:certbot/certbot
RUN apt-get update && \
apt-get install -y nginx-extras most htop neovim ufw fail2ban

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
