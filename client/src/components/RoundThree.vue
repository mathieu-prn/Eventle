<template>
  <div v-if="!lockedGuess" id="round3">
    <h2>Order the following events:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
  </div>
  <div v-else id="round3-guessed">
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
