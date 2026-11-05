<template>
  <p>Today's Event: {{ $gameId }}</p>
</template>

<script>
import axios from "axios";

export default {
  async mounted() {
    console;
    const gameRes = await axios.get("http://localhost:3000/play");
    console.log(gameRes.data.event_id);
    this.$gameId = gameRes.data.event_id;
  },
};
</script>
