FROM node:18

RUN mkdir -p /app

WORKDIR /app

ADD . ./

RUN npm install
