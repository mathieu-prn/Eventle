import { createApp } from 'vue'
import { createWebHistory, createRouter } from 'vue-router'

import App from './App.vue'
import "./main.css"
import HomeView from './views/HomeView.vue'
import PlayView from './views/PlayView.vue'
import LoginView from './views/LoginView'

const routes = [
    {path: "/", component: HomeView},
    {path: "/play", component: PlayView},
    {path: "/login", component: LoginView}
]

export const router  = createRouter({
  history: createWebHistory(),
  routes,
})

createApp(App).use(router).mount('#app')


