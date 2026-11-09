<script setup>
import RoundOne from "../components/RoundOne";
import RoundTwo from "../components/RoundTwo";
import RoundThree from "../components/RoundThree";
</script>

<template>
  <div id="container">
    <div id="main-game">
      <img
        src="../assets/icons/year.svg"
        alt=""
        class="round-icon"
        :class="{ activeicon: actualRound == 1 }"
      />
      <img
        src="../assets/icons/location.svg"
        alt=""
        class="round-icon"
        :class="{ activeicon: actualRound == 2 }"
      />
      <img
        src="../assets/icons/order.svg"
        alt=""
        class="round-icon"
        :class="{ activeicon: actualRound == 3 }"
      />
      <p>Round {{ actualRound }} of 3</p>
      <RoundOne
        v-if="actualRound == 1"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
      ></RoundOne>
      <RoundTwo
        v-if="actualRound == 2"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
      ></RoundTwo>
      <RoundThree
        v-if="actualRound == 3"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
      ></RoundThree>
      <button v-if="!lockedGuess" @click="() => (lockedGuess = !lockedGuess)">
        GUESS !
      </button>
      <button
        v-if="lockedGuess"
        @click="
          () => {
            actualRound++;
            lockedGuess = !lockedGuess;
          }
        "
      >
        NEXT ROUND ⇨
      </button>
    </div>
  </div>
</template>

<style>
#container {
  display: flex;
  justify-content: center;
}

#main-game {
  width: 50vw;
  height: 70vh;
  background-color: #1f3579;
  color: white;
  border-radius: 50px;
  padding: 30px;
  margin: 30px;
  text-align: center;
  box-shadow: 20px 20px #f4690d;
}

button {
  margin: 30px;
  background-color: #f4690d;
  border-radius: 20px;
  width: 200px;
  height: 75px;
  font-size: 20px;
  border: solid black;
  box-shadow: 7px 7px white;
  transition: 0.3s;
}

button:hover {
  cursor: pointer;
  box-shadow: 10px 10px white;
}

.round-icon {
  width: 40px;
  border-radius: 20px;
  padding: 3px;
  margin: 5px;
}

.activeicon {
  background-color: #f4690d;
}
</style>

<script>
import axios from "axios";

export default {
  data() {
    return {
      eventId: 0,
      eventClue: "",
      comparedId: [],
      actualRound: 1,
      lockedGuess: false,
    };
  },
  async mounted() {
    const setupRes = await axios.get("http://localhost:3000/play");
    this.eventId = setupRes.data.event_id;
    this.eventClue = setupRes.data.event_clue;
  },
};
</script>
