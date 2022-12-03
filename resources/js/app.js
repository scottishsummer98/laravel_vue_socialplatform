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
    path: '/register',
    component: require('./pages/auth/Register').default,
  },
  {
    path: '/login',
    component: require('./pages/auth/Login').default,
  },
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
          return next({ path: '/login' })
        })
    },
  },
  {
    path: '/friends',
    component: require('./pages/Friends').default,
  },
  {
    path: '/pages',
    component: require('./pages/Pages').default,
  },
  {
    path: '/profile',
    component: require('./pages/Profile').default,
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
