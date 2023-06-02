#https://github.com/nodejs/docker-node
FROM node:18

#Modules to non root directory
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
#Set production env
ENV NODE_ENV=production

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Bundle app source
COPY ./src ./src

# Building for production
RUN npm ci --only=production

EXPOSE 443
#Set user to node instead of root
USER node
CMD [ "node", "src/index.js" ]