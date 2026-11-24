<template>
  <div id="howtoplay">
    <h1>How to play ?</h1>
    <div class="step">
      <h2>
        1. Guess the
        <span class="highlight">year</span>
      </h2>
      <p>
        We give you an event and you guess when it happened. The closer you are,
        the more points you get !
      </p>
    </div>
    <div class="step">
      <h2>
        2. Guess the
        <span class="highlight">location</span>
      </h2>
      <p>
        We give you a map and you point where the event happened. The closer you
        are, the more points you get !
      </p>
    </div>
    <div class="step">
      <h2>3. Guess the <span class="highlight">order</span></h2>
      <p>
        We give you three other events and you have to order them by
        chronological order. The better the order, the more points you get !
      </p>
    </div>
  </div>
</template>

<style scoped>
#howtoplay {
  background-color: #1f3579;
  color: white;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
  box-sizing: border-box;
  padding: clamp(28px, 6vw, 56px) clamp(16px, 5vw, 48px);
}

#howtoplay > h1 {
  margin: 0 0 14px;
  text-align: center;
  font-size: clamp(28px, 5vw, 42px);
}

.step {
  width: min(620px, 100%);
  border-left: 4px solid #f4690d;
  padding: 8px 18px;
  box-sizing: border-box;
}

.step h2 {
  margin: 8px 0;
}

.step p {
  line-height: 1.5;
  margin: 8px 0;
}
</style>
