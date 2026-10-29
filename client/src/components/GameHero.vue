<template>
  <div id="container">
    <h1>Learn more about history.</h1>
    <h1>Every day.</h1>
    <h1>
      <span class="highlight">Event</span> by
      <span class="highlight">event</span>.
    </h1>
    <button>PLAY TODAY'S ! ⇨</button>
  </div>
</template>

<style scoped>
#container {
  display: flex;
  flex-direction: column;
  align-items: center;
  row-gap: 0px;
  margin: 50px;
}

h1 {
  font-size: 60px;
  margin: 30px;
}

button {
  margin: 30px;
  background-color: #f4690d;
  border-radius: 20px;
  width: 200px;
  height: 75px;
  font-size: 20px;
  border: solid white;
  box-shadow: 7px 7px #1f3579;
  transition: 0.3s;
}

button:hover {
  cursor: pointer;
  box-shadow: 10px 10px #1f3579;
}
</style>
