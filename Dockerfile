FROM ubuntu:16.04
MAINTAINER karl.zerlauth@gmail.com
ENV REFRESHED_AT 2017-04-12

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | tee -a /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get update && apt-get install -y \
apt-utils \
autoconf \
automake \
build-essential \
cmake \
fsharp \
gettext \
git \
git-core \
gnome-sharp2 \
gtk-sharp2 \
intltool \
libssh2-1-dev \
libtool \
libtool-bin \
lsb-base \
monodoc-base \
mono-mcs \
mono-addins-utils \
mono-complete \
msbuild \
python \
referenceassemblies-pcl \
software-properties-common \
sudo \
systemd \
tzdata \
wget \
xterm \
zlib1g-dev \
&& apt-get autoclean && rm -rf /var/lib/apt/lists/*
 
RUN mkdir /opt/source && \
cd /opt/source && \
git clone https://github.com/mono/monodevelop.git --branch monodevelop-6.3.0.863 --depth 1 6.3.0.863 && \
cd /opt/source/6.3.0.863 && \
git submodule update --init --recursive &&\
cd /opt/source/6.3.0.863 && \
./configure --profile=stable --enable-release && \
make && \
make install && \
rm -rf /opt/*

WORKDIR /home

CMD [ "/usr/local/bin/monodevelop" ]

