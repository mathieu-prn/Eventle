<template>
    <div id="login">
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
                username: '',
                password: ''
            };
        },
        methods: {
            async login() {
                try {
                    const response = await axios.post('/login', {
                        username: this.username,
                        password: this.password
                    });
                    if (response.data.success) {
                        alert('Login successful!');
                    } else {
                        alert('Login failed. Please check your credentials.');
                    }
                } catch (error) {
                    console.error('Error during login:', error);
                    alert('An error occurred during login. Please try again later.');
                }
            }
        }
    };
</script>

<style scoped>


</style>