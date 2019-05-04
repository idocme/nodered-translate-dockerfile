FROM node:current

RUN mkdir -p /root/.node-red
WORKDIR /root/.node-red

# download latest stable node-red
RUN npm install -g --unsafe-perm node-red

COPY /nodered ./
RUN npm install

EXPOSE 1880

RUN npm install -g wait-for-mongodb-slim
CMD wait-for-mongo --uri $MONGO_URI --t 2.5 && node-red
