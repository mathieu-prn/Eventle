<template>
  <div id="gamehero">
    <h1>Learn more about history.</h1>
    <h1>Every day.</h1>
    <h1>
      <span class="highlight">Event</span> by
      <span class="highlight">event</span>.
    </h1>
    <router-link to="/play"><button>PLAY TODAY'S ! ⇨</button></router-link>
  </div>
</template>

<style scoped>
#gamehero {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 52vh;
  box-sizing: border-box;
  justify-content: center;
  margin: 24px clamp(16px, 5vw, 50px);
  text-align: center;
}

h1 {
  font-size: clamp(36px, 7vw, 64px);
  line-height: 1.05;
  margin: clamp(10px, 2vw, 20px);
}

button {
  margin: 24px 8px;
  background-color: #f4690d;
  border-radius: 16px;
  width: min(220px, 80vw);
  min-height: 64px;
  font-size: clamp(16px, 2vw, 20px);
  font-weight: 700;
  border: 2px solid white;
  box-shadow: 7px 7px #1f3579;
  transition: transform 0.2s, box-shadow 0.2s;
}

button:hover {
  cursor: pointer;
  transform: translate(-2px, -2px);
  box-shadow: 9px 9px #1f3579;
}

@media (max-width: 520px) {
  #gamehero {
    min-height: 48vh;
    margin: 18px 12px;
  }

  h1 {
    font-size: clamp(30px, 11vw, 42px);
  }
}
</style>
