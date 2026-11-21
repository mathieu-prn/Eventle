<script setup>
import { VueDraggable } from "vue-draggable-plus";
</script>

<template>
  <div v-if="!lockedGuess" id="round3">
    <h2>Order the following events:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>

    <div id="event-stack">
      <VueDraggable
        v-model="localOrder"
        class="draggable-list"
        chosen-class="chosen"
        drag-class="dragging"
        ghost-class="ghost"
        easing="ease-out"
        :animation="220"
        :swap-threshold="0.65"
        :delay="80"
        :delay-on-touch-only="true"
      >
        <div
          v-for="event in localOrder"
          :key="event.id"
          class="draggable-event"
        >
          <p>{{ event.name }}</p>
        </div>
      </VueDraggable>
    </div>
  </div>
  <div v-else id="round3-guessed">
    <h2>Good job !</h2>
  </div>
</template>

<style scoped>
#round3 {
  width: 100%;
  max-width: 680px;
  margin: 0 auto;
}

#round3 h2 {
  margin: 8px 0;
  font-size: clamp(18px, 2vw, 24px);
}

#event-stack {
  display: flex;
  justify-content: center;
  width: 100%;
  margin: 18px auto 0;
}

.draggable-list {
  width: 80%;
  max-width: 560px;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.draggable-event {
  background-color: #fff2db;
  color: #1f3579;
  width: 100%;
  min-height: 54px;
  box-sizing: border-box;
  border: 2px solid transparent;
  border-radius: 14px;
  display: flex;
  align-items: center;
  padding: 8px 18px;
  box-shadow: 4px 4px 0 #f4690d;
  cursor: grab;
  transition: border-color 0.15s, transform 0.15s;
}

.draggable-event:active {
  cursor: grabbing;
  transform: scale(0.99);
}

.draggable-event p {
  margin: 0;
  font-weight: 700;
}

.drag-grip {
  margin-left: auto;
  padding-left: 12px;
  font-size: 22px;
  line-height: 1;
  color: #f4690d;
  opacity: 0.75;
}

.draggable-event:hover {
  border-color: #f4690d;
  transform: translateY(-2px);
  box-shadow: 5px 7px 0 #f4690d;
}

.chosen {
  border-color: #f4690d;
  transform: scale(1.02);
  box-shadow: 7px 9px 0 #f4690d;
}

.dragging {
  opacity: 0.92;
  transform: rotate(1deg) scale(1.03);
  box-shadow: 9px 12px 18px rgba(31, 53, 121, 0.25);
}

.ghost {
  opacity: 0.7;
  background: #c8ebfb;
  border: 2px dashed #1f3579;
  box-shadow: none;
  transform: scale(0.98);
}

#round3-guessed {
  min-height: 180px;
  display: grid;
  place-items: center;
}

@media (max-width: 600px) {
  .draggable-list {
    width: 92%;
  }
}
</style>

<script>
export default {
  data() {
    return {
      list: [
        { id: 1, name: "Event 1" },
        { id: 2, name: "Event 2" },
        { id: 3, name: "Event 3" },
      ],
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
    orderGuess: {
      type: Array,
      required: true,
    },
  },
  emits: ["update:orderGuess"],
  computed: {
    localOrder: {
      get() {
        return this.orderGuess;
      },
      set(value) {
        this.$emit("update:orderGuess", value);
      },
    },
  },
};
</script>
