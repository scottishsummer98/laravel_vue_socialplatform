<template class="hold-transition register-page">
  <div class="register-box">
    <div class="card card-outline">
      <div class="card-header text-center">
        <a href="" class="h4" style="text-decoration: none;">
          <b>Registration</b>
        </a>
      </div>
      <div class="card-body">
        <div class="input-group mb-4">
          <input
            placeholder="Full Name"
            id="name"
            type="text"
            class="form-control"
            v-model="formData.name"
          />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-4">
          <input
            placeholder="Email Address"
            id="email"
            type="email"
            class="form-control"
            v-model="formData.email"
          />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-4">
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
        <div class="input-group mb-4">
          <input
            placeholder="Retype Password"
            id="password-confirm"
            type="password"
            class="form-control"
            v-model="formData.password_confirmation"
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
            <button type="submit" class="btn btn-success" @click="registerUser">
              Register
            </button>
          </div>
        </div>
        <div class="social-auth-links text-center">
          <button class="btn btn-block btn-primary" @click="redirect">
            Already Registered?
          </button>
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
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      },
    }
  },
  methods: {
    redirect() {
      window.location.href = '/login'
    },
    registerUser() {
      axios
        .post('api/register-user', this.formData)
        .then(() => {
          window.location.href = '/admin'
          showSuccess('Registration Successful')
        })
        .catch((error) => {
          showError('Registration Failed')
        })
    },
  },
}
</script>

<style>
.register-page {
  background-image: linear-gradient(to right, darkgreen, royalblue);
}
.card-outline {
  color: darkgreen;
}
</style>
