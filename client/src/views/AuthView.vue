<template>
  <p v-if="authStatus === 'checking'"></p>
  <NotloggedIn v-else-if="!user" @logged-in="handleLogin"/>
  <main v-else class="account-page">
    <h1>Welcome back <span id="username">{{ user.username }}</span>!</h1>
    <AccountDetails v-if="details" :user="user" @closeDetails="details = false"/>
    <div v-else class="account-actions">
      <AdminDashboard v-if="user.isAdmin" />
      <ViewAccount @logged-out="handleLogout" @accountDetails="details = true"/>
    </div>
  </main>
</template>

<script>
import axios from 'axios';
import NotloggedIn from '../components/AuthViewNotLoggedIn.vue';
import ViewAccount from '../components/ViewAccount.vue';
import AdminDashboard from '../components/AdminDashboard.vue';
import AccountDetails from '../components/AccountDetails.vue';

export default {
  components: { NotloggedIn, ViewAccount, AdminDashboard, AccountDetails },
  data() {
    return { 
      user: null,
      authStatus: 'checking',
      details: false
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
.account-page {
  box-sizing: border-box;
  min-height: calc(100vh - 90px);
  padding: 32px 20px 64px;
}

.account-page h1 {
  margin: 0 0 32px;
  text-align: center;
  color: #1f3579;
  font-size: clamp(2rem, 5vw, 3rem);
}

#username {
  color: #f4690d;
}

.account-actions {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 28px;
}

.account-actions :deep(#admin-dashboard-container) {
  box-sizing: border-box;
  width: min(100%, 560px);
  padding: 20px 28px;
  border: 2px solid #f4690d;
  border-radius: 20px;
  background-color: #fff2db;
  color: #1f3579;
  text-align: center;
}

.account-actions :deep(#admin-dashboard-container h1) {
  margin: 0;
  font-size: 1.4rem;
}

.account-actions :deep(button) {
  min-height: 48px;
  margin: 0 8px;
  padding: 12px 24px;
  border: 0;
  border-radius: 12px;
  background-color: #f4690d;
  color: white;
  font: inherit;
  font-weight: 700;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
}

.account-actions :deep(button:hover) {
  background-color: #ff7b28;
  transform: translateY(-2px);
  box-shadow: 5px 5px #1f3579;
}

@media (max-width: 520px) {
  .account-page {
    min-height: calc(100vh - 80px);
    padding: 24px 20px 48px;
  }

  .account-actions :deep(button) {
    width: 100%;
    margin: 0 0 12px;
  }
}
</style>