<template>
  <EventleHeader></EventleHeader>
  <GameHero></GameHero>
</template>

<script>
import EventleHeader from "./components/EventleHeader";
import GameHero from "./components/GameHero";

export default {
  name: "App",
  components: {
    EventleHeader,
    GameHero,
  },
};
</script>
