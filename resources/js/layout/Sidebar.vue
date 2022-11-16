<template>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img
            src="dist/img/user2-160x160.jpg"
            class="img-circle elevation-2"
            alt="User Image"
          />
        </div>
        <div class="info">
          <a href="#" class="d-block" style="text-decoration: none;">
            <router-link to="/profile" class="nav-link">
              {{ user.fname }} {{ user.lname }}
            </router-link>
          </a>
        </div>
      </div>

      <nav class="mt-2">
        <ul
          class="nav nav-pills nav-sidebar flex-column"
          data-widget="treeview"
          role="menu"
          data-accordion="false"
        >
          <li class="nav-item">
            <router-link to="/friends" class="nav-link">
              <i class="nav-icon fas fa-user-group mr-3"></i>
              <p>
                Find Friends
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/pages" class="nav-link">
              <i class="nav-icon fas fa-flag mr-3"></i>
              <p>
                Pages
              </p>
            </router-link>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      user: [],
    }
  },
  mounted() {
    axios.get('/api/user').then((res) => {
      this.user = res.data
    })
  },
}
</script>
<style>
.sidebar-dark-primary {
  background-image: linear-gradient(black, rgb(74, 1, 1), black);
}
</style>
