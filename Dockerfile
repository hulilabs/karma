FROM node:6

# We need wget to download PhantomJS and other libraries that need to be installed for PhantomJS to work
RUN apt-get update && apt-get install -y wget libfontconfig1 libfreetype6

# Set up Environment variables for PhantomJS
ENV PHANTOMJS_VERSION 2.1.1
ENV PHANTOMJS_DIR /phantomjs

# Download and untar PhantomJS
RUN wget -q --continue -P $PHANTOMJS_DIR "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2"
RUN tar -xaf $PHANTOMJS_DIR/phantomjs* --strip-components=1 --directory "$PHANTOMJS_DIR"

# Set the PATH to include PhantomJS
ENV PATH $PHANTOMJS_DIR/bin:$PATH

# Set the node modules path
ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

# Install the node packages
COPY package.json /install/package.json
WORKDIR /install/
RUN npm install

VOLUME /app
WORKDIR /app
