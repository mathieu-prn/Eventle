<template>
  <EventleHeader></EventleHeader>
  <GameHero></GameHero>
  <HowToPlay></HowToPlay>
</template>

<script>
import EventleHeader from "./components/EventleHeader";
import GameHero from "./components/GameHero";
import HowToPlay from "./components/HowToPlay";

export default {
  name: "App",
  components: {
    EventleHeader,
    GameHero,
    HowToPlay,
  },
};
</script>
