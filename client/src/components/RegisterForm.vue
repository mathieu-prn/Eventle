<template>
    <div id="register">
        <h2>Register</h2>
        <form @submit.prevent="register" class="form auth-fields">
        <input type="text" v-model="username" placeholder="Username" required />
        <input type="email" v-model="email" placeholder="Email" required />
        <input type="password" v-model="password" placeholder="Password" required />
        <input type="password" v-model="confirmPassword" placeholder="Confirm Password" required />
        <button class="submit-button" type="submit">Register</button>
        </form>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                username: '',
                email: '',
                password: '',
                confirmPassword: ''
            }
        },
        methods: {
            async register() {
                if (this.password != this.confirmPassword) {
                    alert('Passwords do not match.');
                    return;
                }
                else {
                    try {
                        const response = await axios.post('/register', {
                            username: this.username,
                            email: this.email,
                            password: this.password
                        });
                        if (response.data.success) {
                            alert('Registration successful!');
                        } else {
                            alert('Registration failed. Please try again.');
                        }
                    } catch (error) {
                        console.error('Error during registration:', error);
                        alert('An error occurred during registration. Please try again later.');
                    }
                }
            }
        }
    }

</script>

<style scoped>

</style>