FROM node:10.14.0 as builder
WORKDIR /usr/src/app
COPY ./src/package.json .
COPY ./src/package-lock.json* .
RUN npm install
FROM node:10.14.0
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/
COPY . .
CMD ['npm', 'start']
