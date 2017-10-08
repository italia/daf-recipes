FROM node:8.6.0-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#COPY package.json /usr/src/app/
COPY . /usr/src/app
RUN npm install

CMD [ "npm", "start" ]
