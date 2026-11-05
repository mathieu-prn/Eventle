<template>
  <p>Today's Event: {{ gameId }}</p>
  <p>Compared to events</p>
  <ul>
    <li v-for="id in comparedId" :key="id">{{ id }}</li>
  </ul>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      gameId: 0,
      comparedId: [],
    };
  },
  async mounted() {
    const setupRes = await axios.get("http://localhost:3000/play");
    this.gameId = setupRes.data.event_id;
    this.comparedId = [
      setupRes.data.comparison1,
      setupRes.data.comparison2,
      setupRes.data.comparison3,
    ];
  },
};
</script>
