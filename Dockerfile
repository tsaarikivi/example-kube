FROM node:alpine AS build
WORKDIR /build
COPY package*.json ./
RUN npm ci --silent
COPY . .
RUN npm run build

FROM node:alpine
WORKDIR /app
COPY package*.json ./
COPY --from=build /build/dist ./dist
RUN npm ci --production --silent

EXPOSE 8080
CMD npm start