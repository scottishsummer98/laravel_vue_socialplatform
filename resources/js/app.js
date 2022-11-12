require('./bootstrap')
require('jquery')

import { createRouter, createWebHistory } from 'vue-router'
import { createApp } from 'vue'

import FrontEnd from './layout/frontEnd/Layout'
import BackEnd from './layout/backEnd/Layout'
import Register from './pages/auth/Register'
import Login from './pages/auth/Login'
import axios from 'axios'

const routes = [
  {
    path: '/',
    component: require('./pages/frontEnd/Home').default,
  },
  {
    path: '/about',
    component: require('./pages/frontEnd/About').default,
  },
  {
    path: '/admin',
    component: require('./pages/backend/Dashboard').default,
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
    path: '/admin-about',
    component: require('./pages/backend/About').default,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

const app = createApp({})
app.component('frontend-component', FrontEnd)
app.component('backend-component', BackEnd)
app.component('register-component', Register)
app.component('login-component', Login)
app.use(router)

app.mount('#app')
