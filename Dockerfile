FROM node:slim
MAINTAINER j.ciolek@webnicer.com
WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre fonts-roboto
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb
RUN mkdir /protractor
WORKDIR /protractor
RUN cd /protractor
COPY package.json /protractor/package.json
RUN npm install .
RUN npm run webdriver-update
COPY protractor.sh /protractor/protractor.sh
ENTRYPOINT ["/protractor/protractor.sh"]
