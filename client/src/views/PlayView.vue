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
        @click="reviewRound(1)"
      />
      <img
        src="../assets/icons/location.svg"
        alt=""
        class="round-icon"
        :class="{ activeicon: actualRound == 2 }"
        @click="reviewRound(2)"
      />
      <img
        src="../assets/icons/order.svg"
        alt=""
        class="round-icon"
        :class="{ activeicon: actualRound == 3 }"
        @click="reviewRound(3)"
      />
      <p>Round {{ actualRound }} of 3</p>
      <RoundOne
        v-if="actualRound == 1"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        :correct="correct1"
        v-model:yearGuess="guess1"
      ></RoundOne>
      <RoundTwo
        v-if="actualRound == 2"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        :correct="correct2"
        v-model:coordGuess="guess2"
      ></RoundTwo>
      <RoundThree
        v-if="actualRound == 3"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        v-model:orderGuess="guess3"
      ></RoundThree>
      <button v-if="!lockedGuess" @click="checkAnswer">GUESS !</button>
      <button
        v-if="lockedGuess"
        @click="
          () => {
            lockedGuess = !lockedGuess;
            actualRound++;
          }
        "
      >
        NEXT ROUND ⇨
      </button>
    </div>
  </div>
</template>

<style scoped>
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

.round-icon:hover {
  cursor: pointer;
  background-color: #f4690d;
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
      actualRound: 1,
      maxRound: 1,
      lockedGuess: false,
      guess1: 0,
      guess2: [0, 0],
      guess3: [],
      correct1: {},
      correct2: {},
      correct3: {},
    };
  },
  methods: {
    async checkAnswer() {
      switch (this.actualRound) {
        case 1:
          try {
            const response = await axios.post("http://localhost:3000/round1", {
              eventId: this.eventId,
              yearGuess: this.guess1,
              userId: 0,
            });
            if (response.data) {
              this.correct1 = response.data;
              this.lockedGuess = !this.lockedGuess;
            }
          } catch (error) {
            console.error("Error:", error);
            alert(
              error.response.data.message ||
                "An error occurred. Please try again later."
            );
          }

          break;

        case 2:
          try {
            const response = await axios.post("http://localhost:3000/round2", {
              eventId: this.eventId,
              guessLat: this.guess2[0],
              guessLng: this.guess2[1],
              userId: 0,
            });
            if (response.data) {
              this.correct2 = response.data;
              this.lockedGuess = !this.lockedGuess;
            }
          } catch (error) {
            console.error("Error:", error);
            alert(
              error.response.data.message ||
                "An error occurred. Please try again later."
            );
          }
          break;
        default:
          break;
      }
    },
    reviewRound(round) {
      const maxRound = this.lockedGuess
        ? this.actualRound + 1
        : this.actualRound;

      if (maxRound > this.maxRound) this.maxRound = maxRound;

      console.log(this.maxRound);

      if (round < this.maxRound) {
        this.actualRound = round;
        this.lockedGuess = true;
      } else if (round == this.maxRound) {
        this.actualRound = this.maxRound;
        this.lockedGuess = false;
      }
    },
  },
  async mounted() {
    const setupRes = await axios.get("http://localhost:3000/play");
    this.eventId = setupRes.data.event_id;
    this.eventClue = setupRes.data.event_clue;
    this.guess3 = [
      { id: 1, name: "Event 1" },
      { id: 2, name: "Event 2" },
      { id: 3, name: "Event 3" },
    ];
  },
};
</script>
