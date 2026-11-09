<template>
    <div v-if="!user" id="login">
        <h2>Login</h2>
        <form @submit.prevent="login" class="form auth-fields">
        <input type="text" v-model="username" placeholder="Username" required />
        <input type="password" v-model="password" placeholder="Password" required />
        <button class="submit-button" type="submit">Login</button>
        </form>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        data() {
            return {
                user: null
            };
        },
        methods: {
            async login() {
                try {
                    const response = await axios.post('http://localhost:3000/login', {
                        username: this.username,
                        password: this.password
                    });
                    if (response.data.success) {
                        alert(response.data.message);
                        this.user = response.data.user;
                        localStorage.setItem('accessToken', response.data.token);
                    } else {
                        alert(response.data.message);
                    }
                } catch (error) {
                    console.error('Error during login:', error);
                    alert(error.response.data.message || 'An error occurred during login. Please try again later.');
                }
            }
        }
    };
</script>

<style scoped>


</style>