<template>
  <div v-if="!lockedGuess" id="round2">
    <h2>Where did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
  </div>
  <div v-else id="round2-guessed">
    <h2>Good job !</h2>
  </div>
</template>

<script>
export default {
  data() {},
  props: {
    eventClue: {
      type: String,
      required: true,
    },
    lockedGuess: {
      type: Boolean,
      required: true,
    },
  },
};
</script>
