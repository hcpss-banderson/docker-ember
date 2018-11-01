FROM banderson/node-bower-gulp

RUN npm install -g ember-cli

# Watchman
RUN git clone https://github.com/facebook/watchman.git /root/watchman \
    && cd /root/watchman \
    && git checkout v4.9.0 \
    && apt-get update \
    && apt-get install -y autoconf automake build-essential python-dev \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7020
EXPOSE 4200

CMD ["ember", "serve"]
