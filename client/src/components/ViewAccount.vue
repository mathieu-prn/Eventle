<template>
  <button @click="$emit('accountDetails')">Account details</button>
  <button @click="handleLogout">Logout</button>
</template>

<script>
    export default {
        props: {
            user: {
                type: Object,
                required: true
            }
        },
        methods: {
            handleLogout() {
                this.$emit('logged-out');
            }
        }
    };
</script>

<style scoped>
    
</style>