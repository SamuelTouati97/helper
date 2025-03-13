FROM node:21.7.3


WORKDIR /app


COPY package.json package-lock.json ./


RUN npm install --only=production


COPY . .


EXPOSE 4000


CMD ["node", "helper.js"]
