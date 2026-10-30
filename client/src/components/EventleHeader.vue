<template>
  <header>
    <img src="../assets/icons/menu.svg" class="icon" @click="toggleMenu" />
    <h1>Eventle</h1>
    <a href="/"> <img src="../assets/icons/account.svg" class="icon" /></a>
    <div id="menu" v-if="showMenu">
      <div class="menu-el">
        <h2>Eventle</h2>
        <img src="../assets/icons/close.svg" class="icon" @click="toggleMenu" />
      </div>
      <a class="menu-el" href="#howtoplay">How to play ?</a>
      <a class="menu-el" href="/">Archive</a>
      <a class="menu-el" href="/">Leaderboard</a>
      <button>PLAY TODAY'S ! ⇨</button>
    </div>
  </header>
</template>

<!-- style below will only apply to the current component-->
<style scoped>
.icon {
  width: 50px;
  height: 50px;
}

header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  margin: 20px 50px 0 50px;
}

#menu {
  width: 30vw;
  height: 70vh;
  border-radius: 20px;
  background-color: #1f3579;
  padding: 20px;
}

.menu-el {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  color: white;
}

a {
  text-decoration: none;
}

a:hover {
  color: #f4690d;
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

<script>
export default {
  data() {
    return {
      showMenu: false,
    };
  },
  methods: {
    toggleMenu() {
      this.showMenu = !this.showMenu;
    },
  },
};
</script>
