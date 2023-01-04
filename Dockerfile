FROM node:alpine
RUN  mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY server.js /app
EXPOSE 8080
CMD ["npm","start"]
