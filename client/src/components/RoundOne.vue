<template>
  <div v-if="!lockedGuess" id="round1">
    <h2>When did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
    <div class="slider-stack">
      <input
        id="year-input"
        type="number"
        placeholder="Guess a year..."
        size="5"
        v-model="localYear"
        min="-10000"
        max="2026"
        @input="yearToPos"
      />
      <input
        type="range"
        min="0"
        max="100"
        step="0.01"
        class="year-slider"
        id="year-slider-active"
        v-model="sliderPosition"
        @input="posToYear"
      />
    </div>
  </div>
  <div v-else id="round1-results">
    <h2>
      You gained <span class="highlight">{{ correct.points }} </span> points !
    </h2>
    <div class="result-slider">
      <input
        type="range"
        min="0"
        max="100"
        class="year-slider result-slider-handle guess-handle"
        :value="sliderPosition"
        aria-label="Your guess"
        disabled
      />
      <input
        type="range"
        min="0"
        max="100"
        class="year-slider result-slider-handle answer-handle"
        :value="correctPosition()"
        aria-label="Correct answer"
        disabled
      />
    </div>
    <div class="slider-legend">
      <span class="guess-label">Your guess</span>
      <span class="answer-label">Correct answer</span>
    </div>
    <p>
      You were {{ Math.abs(correct.correctAns - localYear) }} years away. The
      exact year was {{ correct.correctAns }}.
    </p>
  </div>
</template>

<style scoped>
#round1,
#round1-results {
  width: 100%;
  max-width: 680px;
  margin: 0 auto;
}

#round1 h2,
#round1-results h2 {
  margin: 8px 0;
  font-size: clamp(18px, 2.5vw, 24px);
}

.slider-stack {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  margin: 18px auto;
}

#year-input {
  width: min(260px, 72%);
  min-height: 58px;
  box-sizing: border-box;
  border: 2px solid #f4690d;
  border-radius: 14px;
  font-size: clamp(36px, 8vw, 50px);
  text-align: center;
}

.year-slider {
  -webkit-appearance: none;
  width: min(80%, 540px);
  background-color: white;
  border-radius: 20px;
}

.year-slider::-moz-range-track {
  height: 8px;
  background: white;
  border: none;
  border-radius: 20px;
}

.year-slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #f4690d;
  border: none;
}

.year-slider::-webkit-slider-thumb,
.year-slider::-moz-range-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 20px;
  background: #f4690d;
  border: none;
  transition: 0.1s;
}

#year-slider-active::-webkit-slider-thumb:hover,
#year-slider-active::-moz-range-thumb:hover {
  cursor: col-resize;
  width: 30px;
  height: 30px;
}

.result-slider {
  position: relative;
  width: 80%;
  height: 36px;
  margin: 24px auto 8px;
}

.result-slider::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 8px;
  border-radius: 20px;
  background: white;
  transform: translateY(-50%);
}

.result-slider-handle {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 36px;
  margin: 0;
  padding: 0;
  background: transparent;
  pointer-events: none;
}

.result-slider-handle::-webkit-slider-runnable-track {
  background: transparent;
}

.result-slider-handle::-moz-range-track {
  background: transparent;
  border: none;
}

.guess-handle::-webkit-slider-thumb,
.guess-handle::-moz-range-thumb {
  background: #f4690d;
}

.answer-handle::-webkit-slider-thumb,
.answer-handle::-moz-range-thumb {
  background: #1f3579;
  border: 3px solid white;
}

.slider-legend {
  display: flex;
  justify-content: center;
  gap: 24px;
}

.guess-label::before,
.answer-label::before {
  content: "";
  display: inline-block;
  width: 12px;
  height: 12px;
  margin-right: 8px;
  border-radius: 50%;
}

.guess-label::before {
  background: #f4690d;
}

.answer-label::before {
  background: #1f3579;
  border: 2px solid white;
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
  data() {
    return {
      sliderPosition: 50,
    };
  },
  methods: {
    sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    },
    posToYear() {
      let remapped;
      if (this.sliderPosition <= 50)
        remapped = (10000 * this.sliderPosition) / 50 - 10000;
      else remapped = ((this.sliderPosition - 51) * 2026) / 49;
      this.localYear = Math.round(remapped);
    },
    async yearToPos() {
      await this.sleep(0.1);
      let remapped;
      if (this.localYear <= 0)
        remapped = ((this.localYear + 10000) * 50) / 10000;
      else remapped = (this.localYear * 49) / 2026 + 51;

      this.sliderPosition = Math.round(remapped);
    },
    correctPosition() {
      let remapped;
      if (this.correct.correctAns <= 0)
        remapped = ((this.correct.correctAns + 10000) * 50) / 10000;
      else remapped = (this.correct.correctAns * 49) / 2026 + 51;

      return Math.round(remapped);
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
