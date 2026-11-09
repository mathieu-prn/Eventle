<template>
  <h1>Welcome back <span id="username">{{ user.username }}</span> !</h1>
</template>

<script>
    export default {
        props: {
            user: {
                type: Object,
                required: true
            }
        }
    };
</script>

<style scoped>
    h1 {
        text-align: center;
        font-size: 30px;
        color: #1f3579;
    }
    #username {
        color: #f4690d;
    }
</style>