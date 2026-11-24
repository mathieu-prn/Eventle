<template>
  <h2 class="results-title">
    You scored a total of
    <span class="highlight">{{ totalPoints }}</span>
    / 1500 !
  </h2>
  <div class="round-result">
    <img src="../assets/icons/year.svg" alt="" class="round-icon" />
    <div>
      Round 1 - Year: <strong>{{ correct1.points }}/500</strong>
    </div>
    <button @click="seeRound(1)">See round</button>
  </div>
  <div class="round-result">
    <img src="../assets/icons/location.svg" alt="" class="round-icon" />
    <div>
      Round 2 - Map: <strong>{{ correct2.points }}/500</strong>
    </div>
    <button @click="seeRound(2)">See round</button>
  </div>
  <div class="round-result">
    <img src="../assets/icons/order.svg" alt="" class="round-icon" />
    <div>
      Round 3 - Order: <strong>{{ correct3.points }}/500</strong>
    </div>
    <button @click="seeRound(3)">See round</button>
  </div>
  <div>
    <p>
      The event was <strong>{{ correct3.name }}</strong>
    </p>
    <p>Did you know ?</p>
    <p>{{ correct3.description }}</p>
  </div>
</template>

<style scoped>
.results-title {
  margin: 8px 0 18px;
  font-size: clamp(18px, 2vw, 24px);
}

.round-result {
  width: 80%;
  max-width: 560px;
  min-height: 58px;
  box-sizing: border-box;
  margin: 10px auto;
  padding: 8px 14px;
  display: grid;
  grid-template-columns: 46px 1fr auto;
  align-items: center;
  gap: 12px;
  border: 2px solid #fff2db;
  border-radius: 14px;
  background: rgba(255, 242, 219, 0.08);
  text-align: left;
}

.round-icon {
  width: 40px;
  border-radius: 20px;
  padding: 3px;
}

.round-result strong {
  color: #f4690d;
  white-space: nowrap;
}

.round-result button {
  width: auto;
  height: 40px;
  margin: 0;
  padding: 0 14px;
  border: 2px solid #000;
  border-radius: 12px;
  background: #f4690d;
  color: #fff;
  box-shadow: 4px 4px #fff2db;
  font-weight: 700;
  cursor: pointer;
  transition: 0.15s;
}

.round-result button:hover {
  transform: translate(-1px, -1px);
  box-shadow: 5px 5px #fff2db;
}

@media (max-width: 600px) {
  .round-result {
    width: 92%;
    grid-template-columns: 46px 1fr;
  }

  .round-result button {
    grid-column: 1 / -1;
    justify-self: stretch;
  }
}
</style>

<script>
export default {
  props: {
    correct1: {
      type: Object,
      required: true,
    },
    correct2: {
      type: Object,
      required: true,
    },
    correct3: {
      type: Object,
      required: true,
    },
  },
  methods: {
    seeRound(round) {
      this.$emit("review-round", round);
    },
  },
  computed: {
    totalPoints() {
      return (
        Number(this.correct1?.points || 0) +
        Number(this.correct2?.points || 0) +
        Number(this.correct3?.points || 0)
      );
    },
  },
};
</script>
