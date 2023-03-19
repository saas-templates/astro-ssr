# Astro SSR

Astro project with static landing page, Svelte SPA app and API using Astro SSR.

1. Landing page at `/` that's completely static rendered at build.
2. Svelte SPA app at `/app` that's rendered completely on client-side.
3. A simple API `GET /api/counter` using Astro SSR (node adaptor).

Building this project using `yarn build` will produce:

1. `dist/client`
2. `dist/server`

To run the app, `node dist/server/entry.mjs` can be used.
