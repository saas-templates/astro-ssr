FROM node:lts-alpine3.16 AS builder
WORKDIR /code
COPY . .
RUN yarn install
RUN yarn build

FROM denoland/deno:alpine AS runtime
WORKDIR /app
COPY --from=builder /code/package.json .
COPY --from=builder /code/yarn.lock .
COPY --from=builder /code/dist .

ENV HOST=0.0.0.0
ENV PORT=8080
EXPOSE 8080
CMD deno run --allow-net --allow-env --allow-read /app/server/entry.mjs
