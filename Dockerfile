
FROM ubuntu:18.04

MAINTAINER Nate Fugal <info@natefugal.tech>

# Set your timezone here
ENV TZ=America/Denver

# Prep for installing packages from certbot ppa and nginx ppa
RUN apt-get update && \
  apt-get install -y gpg software-properties-common
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu bionic main" \
  > /etc/apt/sources.list.d/nginx-stable.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
RUN add-apt-repository -y ppa:certbot/certbot

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install tzdata
RUN apt-get install -y nginx-extras most htop neovim ufw fail2ban certbot python-certbot-nginx

# Link stdout and stderr to log files
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Open ports on host
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
