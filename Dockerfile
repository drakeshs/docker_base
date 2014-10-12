# VERSION	0.1.0

FROM ubuntu:14.04

RUN locale-gen en_GB.UTF-8
RUN update-locale LANG=en_GB.UTF-8 LANGUAGE="en_GB:"
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:
ENV LC_ALL en_GB.UTF-8
ENV TZ /usr/share/zoneinfo/GB
RUN /usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata
RUN  ln -sf /usr/share/zoneinfo/GB /etc/localtime

RUN apt-get update
RUN apt-get install -y ruby supervisor wget curl cron logrotate screen bcron
RUN mkdir -p /var/run/screen; chmod 775 /var/run/screen

# Setup Tiller
RUN gem install tiller
ADD data/tiller/common.yaml /etc/tiller/common.yaml
ADD data/tiller/templates /etc/tiller/templates

ADD data/screenrc /etc/screenrc
ADD data/supervisor /etc/supervisor/conf.d
