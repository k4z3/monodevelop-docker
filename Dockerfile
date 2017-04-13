FROM k4z3/monodevelop-build-base
MAINTAINER karl.zerlauth@gmail.com
ENV REFRESHED_AT 2017-04-13

RUN mkdir /opt/source && \
cd /opt/source && \
git clone https://github.com/mono/monodevelop.git --branch monodevelop-6.3.0.863 --depth 1 6.3.0.863 && \
cd /opt/source/6.3.0.863 && \
git submodule update --init --recursive && \
cd /opt/source/6.3.0.863 && \
./configure --profile=stable --enable-release && \
make && \
make install && \
rm -rf /opt/source

WORKDIR /home

CMD [ "/usr/local/bin/monodevelop" ]

