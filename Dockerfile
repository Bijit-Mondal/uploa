FROM node:alpine

WORKDIR /app
ADD package.json package.json

RUN npm install

ADD . /app/

CMD ["node", "app.js"]