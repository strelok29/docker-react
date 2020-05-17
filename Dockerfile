FROM node:12.16.3-alpine as builder
WORKDIR '/web'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /web/build /usr/share/nginx/html