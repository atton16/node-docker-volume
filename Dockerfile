FROM node:12-alpine

WORKDIR /usr/src/build

COPY . .
RUN npm ci --only=production
RUN npm run build
