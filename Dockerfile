FROM node:10

RUN npm install -g ember-cli

# Watchman
RUN apt-get update \
    && apt-get install -y \
        autoconf \
        automake \
        build-essential \
        python-dev \
        git \
    && git clone https://github.com/facebook/watchman.git /root/watchman \
    && cd /root/watchman \
    && git checkout v4.9.0 \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /data

EXPOSE 7020
EXPOSE 4200

WORKDIR /data

CMD ["ember", "serve"]
