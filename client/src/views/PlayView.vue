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
  box-sizing: border-box;
  padding: 16px;
}

#main-game {
  width: min(720px, 100%);
  min-height: 70vh;
  box-sizing: border-box;
  background-color: #1f3579;
  color: white;
  border-radius: 36px;
  padding: clamp(18px, 4vw, 36px);
  margin: clamp(8px, 3vw, 30px);
  text-align: center;
  box-shadow: 14px 14px #f4690d;
}

button {
  margin: 24px 8px 8px;
  background-color: #f4690d;
  border-radius: 16px;
  min-width: 180px;
  min-height: 56px;
  padding: 12px 20px;
  font-size: clamp(15px, 2vw, 18px);
  font-weight: 700;
  border: 2px solid black;
  box-shadow: 6px 6px white;
  transition: transform 0.2s, box-shadow 0.2s;
}

button:hover {
  cursor: pointer;
  transform: translate(-2px, -2px);
  box-shadow: 8px 8px white;
}

.round-icon {
  width: clamp(38px, 7vw, 46px);
  height: clamp(38px, 7vw, 46px);
  box-sizing: border-box;
  border-radius: 50%;
  padding: 6px;
  margin: 4px;
  transition: background-color 0.2s, transform 0.2s;
}

.round-icon:hover,
.activeicon {
  cursor: pointer;
  background-color: #f4690d;
}

@media (max-width: 600px) {
  #container {
    padding: 8px;
  }

  #main-game {
    min-height: calc(100vh - 100px);
    border-radius: 24px;
    margin: 8px 4px 18px;
    box-shadow: 8px 8px #f4690d;
  }

  button {
    width: min(220px, 82%);
  }
}
</style>

<script>
import axios from "axios";

export default {
  data() {
    return {
      gameDate: "",
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
    authHeaders() {
      const token = localStorage.getItem("accessToken");
      return token ? { Authorization: `Bearer ${token}` } : {};
    },
    async syncSavedGameToDatabase() {
      if (!localStorage.getItem("accessToken") || !this.eventId) return;

      try {
        if (Object.keys(this.correct1).length) {
          await axios.post(
            "http://localhost:3000/round1",
            {
              eventId: this.eventId,
              yearGuess: this.guess1,
              gameDate: this.gameDate,
            },
            { headers: this.authHeaders() }
          );
        }
        if (Object.keys(this.correct2).length) {
          await axios.post(
            "http://localhost:3000/round2",
            {
              eventId: this.eventId,
              guessLat: this.guess2[0],
              guessLng: this.guess2[1],
              gameDate: this.gameDate,
            },
            { headers: this.authHeaders() }
          );
        }
        if (Object.keys(this.correct3).length) {
          await axios.post(
            "http://localhost:3000/round3",
            {
              orderGuess: this.guess3.map((event) => event.id),
              gameDate: this.gameDate,
            },
            { headers: this.authHeaders() }
          );
        }
      } catch (error) {
        console.error("Could not save game progress after login:", error);
      }
    },
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
            const response = await axios.post(
              "http://localhost:3000/round1",
              {
                eventId: this.eventId,
                yearGuess: this.guess1,
                gameDate: this.gameDate,
              },
              { headers: this.authHeaders() }
            );
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
            const response = await axios.post(
              "http://localhost:3000/round2",
              {
                eventId: this.eventId,
                guessLat: this.guess2[0],
                guessLng: this.guess2[1],
                gameDate: this.gameDate,
              },
              { headers: this.authHeaders() }
            );
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
            const response = await axios.post(
              "http://localhost:3000/round3",
              {
                orderGuess: this.guess3.map((el) => el.id),
                gameDate: this.gameDate,
              },
              { headers: this.authHeaders() }
            );

            const finalResponse = await axios.post(
              "http://localhost:3000/finalanswer",
              {
                eventId: this.eventId,
              }
            );

            if (response.data && finalResponse.data) {
              this.correct3 = {
                ...response.data,
                name: finalResponse.data.event_name,
                description: finalResponse.data.description,
              };
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

    this.gameDate = gameDate;
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
      await this.syncSavedGameToDatabase();
    } else if (localStorage.getItem("accessToken")) {
      try {
        const restoreGame = await axios.post(
          "http://localhost:3000/restore",
          {
            gameDate: this.gameDate,
          },
          { headers: this.authHeaders() }
        );

        if (restoreGame.data && restoreGame.data.length > 0) {
          const dataToRead = restoreGame.data[0];
          this.actualRound = Math.min(dataToRead.current_round ?? 1, 4);
          this.maxRound = dataToRead.current_round ?? 1;
          this.lockedGuess = false;
          if (dataToRead.round1) {
            this.guess1 = dataToRead.guess_year;
            this.correct1 = dataToRead.round1;
          }
          if (dataToRead.round2) {
            this.guess2 = [
              dataToRead.guess_coord_lat,
              dataToRead.guess_coord_lng,
            ];
            this.correct2 = dataToRead.round2;
          }
          if (dataToRead.round3) {
            this.correct3 = dataToRead.round3;
            this.guess3 = dataToRead.round3.correctEvents;
          }
        }
      } catch (err) {
        console.error(err);
      }
    }

    this.saveGameData();
  },
};
</script>
