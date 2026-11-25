<template>
  <header>
    <img src="../assets/icons/menu.svg" class="icon" @click="toggleMenu" />
    <router-link to="/"><h1>Eventle</h1></router-link>
    <router-link to="/login"
      ><img src="../assets/icons/account.svg" class="icon"
    /></router-link>
    <div id="menu" v-if="showMenu">
      <div class="menu-el">
        <h2>Eventle</h2>
        <img src="../assets/icons/close.svg" class="icon" @click="toggleMenu" />
      </div>
      <a class="menu-el" href="/#howtoplay">How to play ?</a>
      <a class="menu-el" href="/archive">Archive</a>
      <router-link to="/play">
        <button>PLAY TODAY'S ! ⇨</button>
      </router-link>
    </div>
  </header>
</template>

<!-- style below will only apply to the current component-->
<style scoped>
.icon {
  width: clamp(38px, 5vw, 50px);
  height: clamp(38px, 5vw, 50px);
}

header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  margin: 20px clamp(16px, 5vw, 50px) 0;
}

#menu {
  width: clamp(280px, 20vw, 320px);
  height: auto;
  min-height: 220px;
  border-radius: 20px;
  background-color: #1f3579;
  padding: 20px;
  box-sizing: border-box;
}

.menu-el {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  color: white;
}

a {
  text-decoration: none;
  color: #1f3579;
  font-size: 20px;
}

a:hover {
  color: #f4690d;
}

button {
  margin: 20px 5%;
  background-color: #f4690d;
  border-radius: 20px;
  width: 90%;
  min-height: 48px;
  font-size: 20px;
  border: solid white;
  box-shadow: 7px 7px #1f3579;
  transition: 0.3s;
}

button:hover {
  cursor: pointer;
  box-shadow: 10px 10px #1f3579;
}

@media (max-width: 520px) {
  header {
    margin: 12px 16px 0;
  }

  .icon {
    width: 38px;
    height: 38px;
  }

  #menu {
    width: calc(100vw - 20px);
    max-width: 320px;
    min-height: 0;
    padding: 16px;
  }

  .menu-el,
  a,
  button {
    font-size: 18px;
  }

  button {
    min-height: 52px;
  }
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
