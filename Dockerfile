# Use official Node.js image
FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

# Start the app
CMD ["node", "server.js"]