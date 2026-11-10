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
      v-model="localYear"
      min="-10000"
      max="2026"
    />
    <input
      type="range"
      min="-10000"
      max="2026"
      id="year-slider"
      v-model="localYear"
    />
  </div>
  <div v-else id="round1-results">
    <h2>You gained {{ correct.points }} points !</h2>
    <input
      type="range"
      min="-10000"
      max="2026"
      id="year-slider"
      :value="correct.correctAns"
      disabled
    />
    <p>The exact year was {{ correct.correctAns }}.</p>
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

#year-slider::-webkit-slider-thumb,
#year-slider::-moz-range-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 20px;
  background: #f4690d;
  border: none;
  cursor: pointer;
  transition: 0.1s;
}

#year-slider::-webkit-slider-thumb:hover,
#year-slider::-moz-range-thumb:hover {
  width: 30px;
  height: 30px;
}
</style>

<script>
export default {
  props: {
    eventClue: {
      type: String,
      required: true,
    },
    lockedGuess: {
      type: Boolean,
      required: true,
    },
    yearGuess: {
      type: Number,
      required: true,
    },
    correct: {
      type: Object,
      required: true,
    },
  },
  emits: ["update:yearGuess"],
  computed: {
    localYear: {
      get() {
        return this.yearGuess;
      },
      set(value) {
        this.$emit("update:yearGuess", Number(value));
      },
    },
  },
};
</script>
