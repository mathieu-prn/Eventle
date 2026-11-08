<template>
  <main class="auth-page">
    <header class="auth-intro">
      <h1>Welcome to <span>Eventle</span></h1>
      <p>Sign in or create an account to keep your history journey going.</p>
    </header>

    <section class="auth-card" aria-label="Account access">
      <component :is="isLogin ? 'LoginForm' : 'RegisterForm'" />
      <button class="switch-button" type="button" @click="toggleForm">
        {{ isLogin ? 'New to Eventle? Create an account' : 'Already have an account? Sign in' }}
      </button>
    </section>
  </main>
</template>

<script>
import LoginForm from '@/components/LoginForm.vue';
import RegisterForm from '@/components/RegisterForm.vue';

export default {
  components: { LoginForm, RegisterForm },
  data() {
    return { isLogin: true };
  },
  methods: {
    toggleForm() {
      this.isLogin = !this.isLogin;
    },
  },
};
</script>

<style scoped>
.auth-page {
  box-sizing: border-box;
  min-height: calc(100vh - 90px);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 32px 20px 64px;
}

.auth-intro {
  margin-bottom: 28px;
  text-align: center;
}

.auth-intro h1 {
  margin: 0 0 8px;
  color: #1f3579;
  font-size: clamp(2rem, 5vw, 3.25rem);
}

.auth-intro h1 span {
  color: #f4690d;
}

.auth-intro p {
  margin: 0;
  color: #1f3579;
  font-size: 1.05rem;
}

.auth-card {
  box-sizing: border-box;
  width: min(100%, 520px);
  padding: 36px 40px;
  background-color: #1f3579;
  color: white;
  border-radius: 32px;
  box-shadow: 12px 12px #f4690d;
  text-align: center;
}

.auth-card :deep(#login h2),
.auth-card :deep(#register h2) {
  margin: 0 0 24px;
  font-size: 1.8rem;
}

.auth-card :deep(.auth-fields) {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.auth-card :deep(.auth-fields input) {
  box-sizing: border-box;
  width: 100%;
  padding: 14px 16px;
  border: 2px solid transparent;
  border-radius: 12px;
  background-color: #fff2db;
  color: #1f3579;
  font: inherit;
}

.auth-card :deep(.auth-fields input::placeholder) {
  color: #66749b;
}

.auth-card :deep(.auth-fields input:focus) {
  outline: none;
  border-color: #f4690d;
  box-shadow: 0 0 0 3px rgb(244 105 13 / 25%);
}

.auth-card :deep(.submit-button),
.switch-button {
  width: 100%;
  min-height: 48px;
  padding: 12px 18px;
  border: 0;
  border-radius: 12px;
  font: inherit;
  font-weight: 700;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
}

.auth-card :deep(.submit-button) {
  margin-top: 4px;
  background-color: #f4690d;
  color: white;
  box-shadow: 5px 5px #fff2db;
}

.auth-card :deep(.submit-button:hover),
.switch-button:hover {
  transform: translateY(-2px);
}

.auth-card :deep(.submit-button:hover) {
  box-shadow: 7px 7px #fff2db;
}

.switch-button {
  margin-top: 24px;
  background-color: #fff2db;
  color: #1f3579;
}

.switch-button:hover {
  background-color: white;
  box-shadow: 4px 4px #f4690d;
}

@media (max-width: 520px) {
  .auth-page {
    min-height: calc(100vh - 80px);
    padding: 24px 20px 48px;
  }

  .auth-intro p {
    max-width: 320px;
    line-height: 1.5;
  }

  .auth-card {
    padding: 30px 24px;
    border-radius: 24px;
  }
}
</style>