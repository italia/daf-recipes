FROM node:5-onbuild

COPY . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT [ "node", "stats.js", "config.js" ]
