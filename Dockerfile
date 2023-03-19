FROM node:lts-alpine3.16 AS builder
WORKDIR /code
COPY . .
RUN yarn install
RUN yarn build

FROM node:lts-alpine3.16 AS runtime
ENV NODE_ENV=production
WORKDIR /app
COPY --from=builder /code/package.json .
COPY --from=builder /code/yarn.lock .
COPY --from=builder /code/dist .

RUN yarn install --production
RUN wget https://gobinaries.com/tj/node-prune --output-document - | /bin/sh && node-prune

ENV HOST=0.0.0.0
ENV PORT=8080
EXPOSE 8080
CMD node /app/server/entry.mjs
