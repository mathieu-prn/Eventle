<script setup>
import RoundOne from "../components/RoundOne";
import RoundTwo from "../components/RoundTwo";
import RoundThree from "../components/RoundThree";
import GameResults from "../components/GameResults";
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
      <p v-if="actualRound < 4">Round {{ actualRound }} of 3</p>
      <RoundOne
        v-if="actualRound == 1"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        :correct="correct1"
        v-model:yearGuess="guess1"
      ></RoundOne>
      <RoundTwo
        v-else-if="actualRound == 2"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        :correct="correct2"
        v-model:coordGuess="guess2"
      ></RoundTwo>
      <RoundThree
        v-else-if="actualRound == 3"
        :eventClue="eventClue"
        :lockedGuess="lockedGuess"
        :correct="correct3"
        v-model:orderGuess="guess3"
      ></RoundThree>
      <GameResults
        v-else-if="actualRound == 4"
        :correct1="correct1"
        :correct2="correct2"
        :correct3="correct3"
        @review-round="reviewRound"
      ></GameResults>

      <button
        v-if="
          (maxRound > 3 && actualRound < 4) || (lockedGuess && actualRound == 3)
        "
        @click="actualRound = 4"
      >
        SEE YOUR RESULTS !
      </button>
      <button v-else-if="!lockedGuess && actualRound <= 3" @click="checkAnswer">
        GUESS !
      </button>
      <button v-else-if="lockedGuess && actualRound < 3" @click="nextRound">
        NEXT ROUND ⇨
      </button>
      <router-link v-else to="/archive">
        <button>PLAY ARCHIVE 👀</button>
      </router-link>
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
    saveGameData() {
      if (!this.eventId) return;

      const date = this.$route.query.date;
      const gameDate =
        date && date < new Date().toISOString().slice(0, 10)
          ? date
          : new Date().toISOString().slice(0, 10);

      localStorage.setItem(
        `gameData:${gameDate}`,
        JSON.stringify({
          eventId: this.eventId,
          eventClue: this.eventClue,
          actualRound: this.actualRound,
          maxRound: this.maxRound,
          lockedGuess: this.lockedGuess,
          guess1: this.guess1,
          guess2: this.guess2,
          guess3: this.guess3,
          correct1: this.correct1,
          correct2: this.correct2,
          correct3: this.correct3,
        })
      );
    },
    nextRound() {
      this.lockedGuess = false;
      this.actualRound++;
      this.saveGameData();
    },
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
              this.saveGameData();
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
              this.saveGameData();
            }
          } catch (error) {
            console.error("Error:", error);
            alert(
              error.response.data.message ||
                "An error occurred. Please try again later."
            );
          }
          break;
        case 3:
          try {
            const response = await axios.post("http://localhost:3000/round3", {
              orderGuess: this.guess3.map((el) => el.id),
              userId: 0,
            });
            if (response.data) {
              this.correct3 = response.data;
              this.lockedGuess = !this.lockedGuess;
              this.saveGameData();
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
      console.log(this.maxRound);
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
      this.saveGameData();
    },
  },
  watch: {
    $data: {
      deep: true,
      handler() {
        this.saveGameData();
      },
    },
  },
  async mounted() {
    const date = this.$route.query.date;
    let setupRes;

    if (date && date < new Date().toISOString().slice(0, 10)) {
      setupRes = await axios.get("http://localhost:3000/playarchive", {
        params: { date },
      });
    } else {
      setupRes = await axios.get("http://localhost:3000/play");
    }

    this.eventId = setupRes.data.event_id;
    this.eventClue = setupRes.data.event_clue;
    this.guess3 = setupRes.data.compare_events;

    const gameDate =
      date && date < new Date().toISOString().slice(0, 10)
        ? date
        : new Date().toISOString().slice(0, 10);
    const savedTry = localStorage.getItem(`gameData:${gameDate}`);

    if (savedTry) {
      try {
        const savedGame = JSON.parse(savedTry);
        if (savedGame.eventId === this.eventId) {
          this.actualRound = savedGame.actualRound ?? 1;
          this.maxRound = savedGame.maxRound ?? 1;
          this.lockedGuess = savedGame.lockedGuess ?? false;
          this.guess1 = savedGame.guess1 ?? 0;
          this.guess2 = savedGame.guess2 ?? [0, 0];
          this.guess3 = savedGame.guess3 ?? this.guess3;
          this.correct1 = savedGame.correct1 ?? {};
          this.correct2 = savedGame.correct2 ?? {};
          this.correct3 = savedGame.correct3 ?? {};
        }
      } catch (error) {
        localStorage.removeItem(`gameData:${gameDate}`);
        console.error("Could not restore saved game:", error);
      }
    }

    this.saveGameData();
  },
};
</script>
