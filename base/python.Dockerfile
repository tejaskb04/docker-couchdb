#
# Install Python
#

RUN apt-add-repository ppa:fkrull/deadsnakes && \
    apt-get update && \
    apt-get install -y \
      python3.5 \
      python-virtualenv \
    && \
    apt-get clean && \
    \
    virtualenv -p python3.5 /virtualenvs/env35 && \
    source /virtualenvs/env35/bin/activate && \
    pip install -U pip && \
    pip install invoke
