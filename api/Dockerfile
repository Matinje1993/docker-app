# It uses node:18-alpine as the base image for the Node.js application
FROM node:18-alpine
# It installs the nodemon package globally for monitoring and watching the backend Express server
RUN npm install -g nodemon
# Creating the working directory named `app`
WORKDIR /usr/app
# Copying all the tools and dependencies in the package.json file to the working directory `app`
COPY package.json .
#Installing all the tools and dependencies in the container
RUN npm install
#Copying all the application source code and files to the working directory `app`
COPY . .

RUN chown -R node:node /usr/app

USER node
#Exposing the container to run on this port 4000
EXPOSE 8081
#Command to start the Docker container for the backed server application
CMD ["npm", "run", "dev"]