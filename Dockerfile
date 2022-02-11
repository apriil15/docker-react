# stage1: build
FROM node:16-alpine AS build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# stage2: setup nginx
FROM nginx

# /usr/share/nginx/html is from nginx documentation
COPY --from=build /app/build /usr/share/nginx/html
