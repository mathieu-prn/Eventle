<template>
  <p v-if="authStatus === 'checking'"></p>
  <NotloggedIn v-else-if="!user" @logged-in="handleLogin"/>
  <ViewAccount v-else :user="user" @logged-out="handleLogout"/>
  <AdminDashboard v-if="user && user.isAdmin" />
</template>

<script>
import axios from 'axios';
import NotloggedIn from '../components/AuthViewNotLoggedIn.vue';
import ViewAccount from '../components/ViewAccount.vue';
import AdminDashboard from '../components/AdminDashboard.vue';

export default {
  components: { NotloggedIn, ViewAccount, AdminDashboard },
  data() {
    return { 
      user: null,
      authStatus: 'checking'
     };
  },
  async created() {
    const token = localStorage.getItem('accessToken');

    if (!token) {
      this.authStatus = 'anonymous';
      return;
    }

    try {
      const response = await axios.post('http://localhost:3000/auth', { token });
      this.user = response.data.user;
      this.authStatus = 'authenticated';
      localStorage.setItem('user', JSON.stringify(this.user));
    } catch (error) {
      if (error.response && error.response.status === 401) {
        localStorage.removeItem('accessToken');
        localStorage.removeItem('user');
        this.authStatus = 'anonymous';
      } else {
        console.error('Could not verify session:', error);
        this.authStatus = 'anonymous';
      }
    }
  },
  methods: {
    handleLogin({ user, token }) {
      this.user = user;
      localStorage.setItem('user', JSON.stringify(user));
      localStorage.setItem('accessToken', token);
      this.authStatus = 'authenticated';
    },
    handleLogout() {
      this.user = null;
      localStorage.removeItem('accessToken');
      localStorage.removeItem('user');
      this.authStatus = 'anonymous';
    }
  },
};
</script>

<style scoped>

</style>