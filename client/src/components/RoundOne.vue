<template>
  <div id="round1">
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
</template>

<style scoped>
#round1 {
  width: 50vw;
  height: 70vh;
  background-color: #1f3579;
  color: white;
  border-radius: 50px;
  padding: 10px 30px;
  margin: 30px;
  text-align: center;
  box-shadow: 20px 20px #f4690d;
}

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
  },
};
</script>
