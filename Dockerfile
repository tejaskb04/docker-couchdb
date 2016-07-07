#
# This file compiled from Dockerfile.in
#

FROM ubuntu:14.04

#
# Environment configurations to get everything to play well
#

# Unicode command line
ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

# Use bash instead of sh, fix stdin tty messages
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

#
# Install the packages we need for getting things done
#

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      curl \
      dos2unix \
      git \
      software-properties-common \
    && \
    apt-get clean

