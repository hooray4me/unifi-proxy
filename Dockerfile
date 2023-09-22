FROM node:18

ENV UNIFIIP=10.11.1.2

WORKDIR /usr/src/app

COPY package*.json ./
COPY *.js ./

RUN curl -sS https://deb.troglobit.com/pubkey.gpg | apt-key add - && \
echo deb [arch=amd64] https://deb.troglobit.com/debian stable main | tee /etc/apt/sources.list.d/troglobit.list && \
apt-get update && apt-get install nemesis -y

RUN npm install

EXPOSE 10001/udp

RUN ./client.js $UNIFIIP

CMD [ "node", "server.js", "packet.json"]

