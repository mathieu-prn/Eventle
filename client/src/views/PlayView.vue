<script setup>
import RoundOne from "../components/RoundOne";
</script>

<template>
  <RoundOne :eventClue="eventClue"></RoundOne>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      eventId: 0,
      eventClue: "",
      comparedId: [],
    };
  },
  async mounted() {
    const setupRes = await axios.get("http://localhost:3000/play");
    this.eventId = setupRes.data.event_id;
    this.eventClue = setupRes.data.event_clue;
  },
};
</script>
