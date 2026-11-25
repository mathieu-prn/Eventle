<template>
  <main class="archive-page">
    <h1>Browse Past Events</h1>
    <section v-if="authStatus === 'anonymous'" class="login-required">
      <h2>Log in to continue</h2>
      <p>Please log in to view and play past events.</p>
      <router-link to="/login"><button>LOG IN</button></router-link>
    </section>
    <div v-if="authStatus === 'authenticated'" id="archive-container">
      <div v-for="date in dates" :key="date" class="archive-event">
        <p>
          <strong>{{ date }}</strong>
        </p>
        <p><strong>Score:</strong>{{ getScore(date) }}</p>
        <router-link
          v-if="date in completedEvents && getScore(date) != '___'"
          :to="{ path: '/playarchive', query: { date } }"
          ><button class="completed_event">Complete ✓</button></router-link
        >
        <router-link
          v-else-if="date in completedEvents"
          :to="{ path: '/playarchive', query: { date } }"
          class="incomplete_event"
          ><button>Continue →</button></router-link
        >
        <router-link
          v-else
          :to="{ path: '/playarchive', query: { date } }"
          class="incomplete_event"
          ><button>Play →</button></router-link
        >
      </div>
    </div>
  </main>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      authStatus: "anonymous",
      dates: [],
      completedEvents: {},
    };
  },
  async created() {
    const token = localStorage.getItem("accessToken");

    if (!token) {
      this.authStatus = "anonymous";
      return;
    }

    try {
      const response = await axios.get("http://localhost:3000/auth", {
        headers: { Authorization: `Bearer ${token}` },
      });
      this.user = response.data.user;
      this.authStatus = "authenticated";
      localStorage.setItem("user", JSON.stringify(this.user));
    } catch (error) {
      if (error.response && error.response.status === 401) {
        localStorage.removeItem("accessToken");
        localStorage.removeItem("user");
        this.authStatus = "anonymous";
      } else {
        console.error("Could not verify session:", error);
        this.authStatus = "anonymous";
      }
    }

    let now = new Date();
    const beginning = new Date("2026-10-29" + "T00:00:00Z");

    while (beginning <= now) {
      this.dates.push(now.toISOString().slice(0, 10));
      now.setDate(now.getDate() - 1);
    }

    try {
      const response = await axios.get("http://localhost:3000/archive", {
        headers: { Authorization: `Bearer ${token}` },
      });
      this.completedEvents = Object.fromEntries(
        response.data.map((item) => [
          item.game_date,
          item.current_round == 4
            ? item.points_round1 + item.points_round2 + item.points_round3
            : "",
        ])
      );
    } catch (error) {
      console.error("Error fetching completed events:", error);
    }
  },
  methods: {
    getScore(date) {
      return this.completedEvents[date] || "___";
    },
  },
};
</script>

<style scoped>
.archive-page {
  box-sizing: border-box;
  min-height: calc(100vh - 90px);
  padding: 24px 16px 48px;
}

h1 {
  margin: 12px 0 24px;
  text-align: center;
  color: #1f3579;
  font-size: clamp(30px, 6vw, 48px);
}

.login-required {
  width: min(440px, calc(100% - 16px));
  box-sizing: border-box;
  margin: 48px auto;
  padding: 28px 24px;
  border-radius: 24px;
  background: #1f3579;
  color: white;
  text-align: center;
  box-shadow: 10px 10px #f4690d;
}

.login-required h2,
.login-required p {
  margin: 8px 0;
}

.login-required button {
  min-width: 180px;
  min-height: 52px;
  margin-top: 16px;
  border: 2px solid black;
  border-radius: 14px;
  background: #f4690d;
  color: white;
  font: inherit;
  font-weight: 700;
  box-shadow: 5px 5px white;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}

.login-required button:hover {
  transform: translate(-2px, -2px);
  box-shadow: 7px 7px white;
}

#archive-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

.archive-event {
  display: grid;
  grid-template-columns: 140px 120px 140px;
  align-items: center;
  gap: 20px;
  width: min(480px, calc(100% - 32px));
  min-height: 64px;
  margin: 6px auto;
  padding: 8px 20px;
  box-sizing: border-box;
  background-color: #1f3579;
  color: white;
  border-radius: 12px;
}

.archive-event p {
  margin: 0;
}

.archive-event a {
  display: flex;
  justify-content: flex-end;
  text-align: right;
  text-decoration: none;
  min-width: 0;
}

.completed_event,
.incomplete_event button {
  background-color: #4caf50;
  border: none;
  color: white;
  border-radius: 12px;
  width: 140px;
  max-width: 100%;
  height: 44px;
  padding: 0 12px;
  font: inherit;
  font-weight: 700;
  cursor: pointer;
  box-sizing: border-box;
  transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
}

.incomplete_event button {
  background-color: #f4690d;
}

.completed_event:hover,
.incomplete_event button:hover {
  transform: translateY(-2px);
  box-shadow: 5px 5px #fff2db;
}

.completed_event:hover {
  background-color: #4caf50;
}

.incomplete_event button:hover {
  background-color: #ff7b28;
}

@media (max-width: 520px) {
  .archive-event {
    grid-template-columns: minmax(100px, 1fr) 70px 100px;
    gap: 8px;
    width: calc(100% - 32px);
    min-height: 60px;
    padding: 8px 10px;
  }

  .completed_event,
  .incomplete_event button {
    width: 100px;
  }
}

@media (max-width: 360px) {
  .archive-event {
    grid-template-columns: minmax(90px, 1fr) 60px 88px;
    gap: 6px;
    width: calc(100% - 20px);
    padding: 8px;
    font-size: 14px;
  }

  .completed_event,
  .incomplete_event button {
    width: 88px;
    height: 40px;
    padding: 0 6px;
    font-size: 14px;
  }
}
</style>
