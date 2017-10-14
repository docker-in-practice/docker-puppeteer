FROM ubuntu:16.04
RUN apt-get update -y && apt-get install -y npm python-software-properties curl git libpangocairo-1.0-0 libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 libxtst6 libnss3 libcups2 libxss1 libxrandr2 libgconf-2-4 libasound2 libatk1.0-0 libgtk-3-0 
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN git clone https://github.com/GoogleChrome/puppeteer
RUN useradd -m puppeteer
RUN chown -R puppeteer: /puppeteer
USER puppeteer
WORKDIR /puppeteer
RUN npm i .
WORKDIR /puppeteer/examples
ENV NODE_PATH /home/puppeteer/node_modules
CMD node search.js

