<template>
  <header>
    <a href="/"> <img src="../assets/icons/menu.svg" class="icon" /></a>
    <h1>Eventle</h1>
    <a href="/"> <img src="../assets/icons/account.svg" class="icon" /></a>
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
</style>
