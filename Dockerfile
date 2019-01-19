FROM node:10.15-alpine

WORKDIR /opt/dialog-spam-bot

COPY src src
COPY package.json package.json
COPY tsconfig.json tsconfig.json
COPY package-lock.json package-lock.json

RUN npm install \
 && npm run build \
 && rm -rf node_modules \
 && npm install --production \
 && rm -rf src tsconfig.json package-lock.json

ENV NODE_ENV production
ENTRYPOINT ["npm", "start"]
