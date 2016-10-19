FROM debian:jessie
MAINTAINER Alexandre Gbaguidi Aïsse <aga@lrde.epita.fr>
RUN echo 'deb http://www.lrde.epita.fr/repo/debian/ stable/' >> /etc/apt/sources.list && \
    echo 'deb http://ftp.uk.debian.org/debian jessie-backports main' >> /etc/apt/sources.list

RUN apt-get update

RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive \
      apt-get install -y --force-yes --no-install-recommends --fix-missing \
      build-essential wget openjdk-8-jre parallel

RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive \
      apt-get install -y --force-yes --no-install-recommends \
      git automake libtool libltdl-dev python3 python3-dev flex bison swig \
      gcc-4.9 g++-4.9 make libbdd0c2 libbdd-dev unzip zlib1g-dev \
    && \
    apt-get clean && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20

COPY install.sh /tmp/install.sh
RUN cd /tmp && ./install.sh; exit 0
#RUN cd $HOME/spot && make install && cd /tmp && rm -f install.sh
