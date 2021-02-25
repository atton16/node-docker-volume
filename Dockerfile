FROM node:12-alpine

WORKDIR /usr/src/build

COPY . .
# Create node_modules
RUN npm ci --only=production
# Build dist
RUN npm run build
