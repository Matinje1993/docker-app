# It uses node:18-alpine as the base image for the Node.js application
FROM node:18-alpine
# It installs the nodemon package globally for monitoring and watching the backend Express server
RUN npm install -g nodemon
# Creating the working directory named `app`
WORKDIR /usr/app
# Copying all the tools and dependencies in the package.json file to the working directory `app`
COPY services/gateway services/gateway
COPY services/gateway/package.json services/gateway/.
COPY package.json .
#Installing all the tools and dependencies in the container
RUN npm install

RUN chown -R node:node /usr/app

USER node
#Exposing the container to run on this port 4000
CMD ["node", "services/gateway/server.js"]