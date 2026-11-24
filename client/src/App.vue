<script setup>
import EventleHeader from "./components/EventleHeader";
import EventleFooter from "./components/EventleFooter";
</script>

<template>
  <EventleHeader></EventleHeader>
  <RouterView />
  <EventleFooter></EventleFooter>
</template>
