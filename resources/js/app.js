require('./bootstrap')
require('jquery')

import { createRouter, createWebHistory } from 'vue-router'
import { createApp } from 'vue'

import Layout from './layout/Layout'
import Register from './pages/auth/Register'
import Login from './pages/auth/Login'
import axios from 'axios'

const routes = [
  {
    path: '/home',
    component: require('./pages/Dashboard').default,
    beforeEnter: (to, form, next) => {
      axios
        .get('/api/authenticiated')
        .then(() => {
          next()
        })
        .catch(() => {
          window.location.href = '/login'
        })
    },
  },
  {
    path: '/about',
    component: require('./pages/About').default,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

const app = createApp({})
app.component('layout-component', Layout)
app.component('register-component', Register)
app.component('login-component', Login)
app.use(router)

app.mount('#app')
