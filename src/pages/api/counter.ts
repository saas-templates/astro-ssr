import type { APIRoute } from "astro";

let counter = 0;

export const get: APIRoute = ({ request }) => {
    counter += 1
    return {
        body: JSON.stringify({
            counter: counter,
        })
    }
}
