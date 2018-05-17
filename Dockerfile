FROM node:4
MAINTAINER Francisco Moctezuma <yazpik@gmail.com>
RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list\
 && apt-get update\
 && apt-get install -y fonts-noto-cjk\
 && rm -rf /var/lib/apt/lists/*
RUN npm install --silent -g markdown-pdf@8.1.1\
 && rm -rf ~/.npm/cache/*\
 && mkdir -p /opt/docs
WORKDIR /opt/docs
COPY fonts.conf /etc/fonts/conf.d/99-local.conf
ENV NODE_PATH /usr/local/lib/node_modules
CMD ["/bin/bash"]
