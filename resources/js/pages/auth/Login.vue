<template class="hold-transition register-page">
  <div class="login-box">
    <div class="card card-outline">
      <div class="card-header text-center">
        <a href="" class="h4" style="text-decoration: none;">
          <b>Login</b>
        </a>
      </div>
      <div class="card-body">
        <div class="input-group mb-3">
          <input
            placeholder="Email"
            id="email"
            type="email"
            class="form-control"
            name="email"
            v-model="formData.email"
          />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input
            placeholder="Password"
            id="password"
            type="password"
            class="form-control"
            v-model="formData.password"
          />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8"></div>
          <div class="col-4">
            <button
              type="submit"
              class="btn btn-success btn-block"
              @click="loginUser"
            >
              Login
            </button>
          </div>
        </div>
        <div class="social-auth-links text-center mt-2 mb-3">
          <button class="btn btn-block btn-primary" @click="redirect">
            Haven't Registered Yet?
          </button>
          <router-link to="#" class="btn btn-block btn-danger">
            Forgot Your Password?
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { showSuccess, showError } from '../../helper'
export default {
  data() {
    return {
      formData: {
        email: '',
        password: '',
      },
    }
  },
  methods: {
    redirect() {
      window.location.href = '/register'
    },
    loginUser() {
      axios
        .post('api/login-user', this.formData)
        .then(() => {
          window.location.href = '/admin'
          showSuccess('Login Successful')
        })
        .catch((error) => {
          showError('Login Failed')
          this.clear()
        })
    },
    clear() {
      this.formData = {
        email: '',
        password: '',
      }
    },
  },
}
</script>

<style>
.login-page {
  background-image: linear-gradient(to right, darkgreen, royalblue);
}
.card-outline {
  color: darkgreen;
}
</style>
