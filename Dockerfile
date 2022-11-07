FROM node:18

# PhantomJS variables
ENV PHANTOMJS_VERSION 2.1.1
ENV PHANTOMJS_DIR /phantomjs
ENV PATH $PHANTOMJS_DIR/bin:$PATH

# Install PhantomJS
RUN mkdir -p $PHANTOMJS_DIR \
    && wget --local-encoding=UTF-8 -O $PHANTOMJS_DIR/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2" \
    && tar -xaf $PHANTOMJS_DIR/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 --strip-components=1 --directory "$PHANTOMJS_DIR" \
    && rm -f $PHANTOMJS_DIR/phantomjs*

RUN apt-get update && \
    apt-get install -y libxtst6 libnss3 libxss1 libatk-bridge2.0-0 libgtk-3-0 libdrm-dev libgbm-dev libasound2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the node modules path
ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

# Install the node packages
COPY package.json /install/package.json
WORKDIR /install/
RUN npm install

# Set the expected app folder
VOLUME /app
WORKDIR /app
