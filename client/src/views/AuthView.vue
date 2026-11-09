<template>
  <NotloggedIn v-if="!user" @logged-in="handleLogin"/>
  <ViewAccount v-else :user="user"/>
</template>

<script>
import NotloggedIn from '../components/AuthViewNotLoggedIn.vue';
import ViewAccount from '../components/ViewAccount.vue';

export default {
  components: { NotloggedIn, ViewAccount },
  data() {
    return { 
      user: JSON.parse(localStorage.getItem('user') || 'null')
     };
  },
  methods: {
    handleLogin({ user, token }) {
      this.user = user;
      localStorage.setItem('user', JSON.stringify(user));
      localStorage.setItem('accessToken', token);
    },
  },
};
</script>

<style scoped>

</style>