<template>
  <div v-if="!lockedGuess" id="round1">
    <h2>When did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
    <input
      id="year-input"
      type="number"
      placeholder="Guess a year..."
      size="5"
      v-model="inputYear"
      min="-3000"
      max="2026"
    />
    <input
      type="range"
      min="-3000"
      max="2026"
      id="year-slider"
      v-model="inputYear"
    />
  </div>
  <div v-else id="round1-results">
    <h2>Good job !</h2>
    <input
      id="year-input"
      type="number"
      placeholder="Guess a year..."
      size="5"
      v-model="inputYear"
      min="-3000"
      max="2026"
    />
    <input
      type="range"
      min="-3000"
      max="2026"
      id="year-slider"
      v-model="inputYear"
    />
  </div>
</template>

<style scoped>
#year-input {
  font-size: 50px;
  text-align: center;
}

#year-slider {
  -webkit-appearance: none;
  width: 80%;
  background-color: white;
  border-radius: 20px;
}
</style>

<script>
export default {
  data() {
    return {
      inputYear: 1000,
    };
  },
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
