<template>
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button">
          <i class="fas fa-bars"></i>
        </a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <router-link to="/home" class="nav-link">
          <i class="fa-sharp fa-solid fa-house"></i>
        </router-link>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <router-link to="/friends" class="nav-link">
          <i class="fa-solid fa-user-group"></i>
        </router-link>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <router-link to="/pages" class="nav-link">
          <i class="fas fa-flag"></i>
        </router-link>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" @click="logout">
          <i class="fa-solid fa-arrow-right-from-bracket"></i>
        </a>
      </li>
    </ul>
  </nav>
</template>

<script>
import { showSuccess, showError } from '../helper'
export default {
  data() {
    return {}
  },
  methods: {
    logout() {
      axios
        .post(`/api/logout-user`)
        .then((response) => {
          window.location.href = '/'
          showSuccess('Logged Out Successfully')
        })
        .catch((err) => {
          showError('Logout Failed')
        })
    },
  },
}
</script>
