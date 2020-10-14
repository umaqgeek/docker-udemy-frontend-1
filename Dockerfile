FROM node:alpine
RUN mkdir /reactproject
WORKDIR /reactproject
COPY ./package.json ./
RUN yarn install
COPY ./ ./
RUN yarn build
FROM nginx
COPY --from=0 /reactproject/build /usr/share/nginx/html

