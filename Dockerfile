FROM node:18 AS dev

WORKDIR /app

COPY ./package*.json ./
COPY ./tsconfig.json ./tsconfig.json

RUN npm ci

COPY ./src ./src

CMD [ "npm", "run", "dev" ]

FROM node:18-alpine AS release

WORKDIR /app


COPY --from=dev /app/package*.json  /app/
COPY --from=dev /app/node_modules   /app/node_modules
COPY --from=dev /app/tsconfig.json  /app/tsconfig.json
COPY --from=dev /app/src            /app/src

RUN npm run test
RUN npm run build
RUN npm prune --omit dev

EXPOSE 3000

CMD [ "npm", "start" ]