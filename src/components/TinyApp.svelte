<script lang="ts">
  import { onMount } from "svelte";

  const seq = async () => {
    return await fetch("/api/counter")
      .then(async (resp) => {
        const body = (await resp.json()) as { counter: number };
        return body.counter;
      })
      .catch((reason) => {
        console.error("error: ", reason);
        return -1;
      });
  };

  let counter = 0;
  onMount(async () => {
    const intr = setInterval(async () => {
      counter = await seq();
    }, 1000);
    return () => clearInterval(intr);
  });
</script>

<div class="w-full min-h-screen grid place-items-center">
  <div class="flex flex-col items-center gap-2 max-w-md">
    <h1
      class="text-3xl font-bold tracking-wide bg-gradient-to-br bg-clip-text text-transparent from-red-600 to-cyan-600"
    >
      Welcome to TinyApp!
    </h1>
    <p>This is rendered on client side using Javascript.</p>
    <p>
      The wiggly counter is javascript magic. The counter value is coming from
      the server using the `GET /counter` endpoint.
    </p>
    <p class="animate-bounce text-2xl font-bold mt-4">{counter}</p>

    <a class="mt-2 link" href="/">Go back to the boring page</a>
  </div>
</div>
