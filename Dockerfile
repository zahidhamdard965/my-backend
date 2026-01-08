FROM node:20

WORKDIR /app

ENV NODE_ENV=development
ENV CHOKIDAR_USEPOLLING=true
ENV WATCHPACK_POLLING=true

COPY package*.json ./

RUN npm ci \
  && npm install -g nodemon \
  && npm cache clean --force

COPY . .

EXPOSE 5000

CMD ["nodemon", "server.js"]
