FROM node:alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --silent
COPY . .
RUN npm run build

FROM node:alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --production --silent
COPY --from=build /usr/src/app/dist ./dist

EXPOSE 8080
CMD npm start