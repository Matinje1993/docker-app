FROM node:18-alpine

#PM2 will be used as PID 1 process
RUN npm install -g pm2@1.1.3

# Copy package json files for services

#WORKDIR /app

COPY api/package.json /app/api/package.json
COPY gateway/package.json /app/gateway/package.json

# Set up working dir
WORKDIR /app

# Install packages
RUN npm config set loglevel warn \
# To mitigate issues with npm saturating the network interface we limit the number of concurrent connections
    && npm config set maxsockets 5 \
    && npm config set progress false \
    && cd ./api \
    && npm i \
    && cd ../gateway \
    && npm i


# Copy source files
COPY . ./

# Expose ports
EXPOSE 3000
EXPOSE 3001

# Start PM2 as PID 1 process
ENTRYPOINT ["pm2", "--no-daemon", "start"]

# Actual script to start can be overridden from `docker run`
CMD ["process.json"]