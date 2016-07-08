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
