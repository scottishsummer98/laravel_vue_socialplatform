<template class="hold-transition register-page">
  <div class="container">
    <div>
      <h1 class="text">Jinnbook</h1>
      <h4 class="text">
        Helps you connect and share with the jinns in your life.
      </h4>
    </div>
    <div style="width: 100%;">
      <div class="login-box">
        <div class="card card-outline">
          <div class="card-body">
            <form @submit.prevent method="post" enctype="multipart/form-data">
              <div class="input-group mb-3">
                <input
                  placeholder="Email"
                  id="email"
                  type="email"
                  class="form-control"
                  name="email"
                  v-model="formData.email"
                />
              </div>
              <div class="input-group mb-3">
                <input
                  placeholder="Password"
                  id="password"
                  type="password"
                  class="form-control"
                  v-model="formData.password"
                />
              </div>
              <div class="row">
                <div class="col-12">
                  <button
                    type="submit"
                    class="btn btn-spooky btn-block"
                    @click="loginUser"
                  >
                    Log in
                  </button>
                </div>
              </div>
              <div class="social-auth-links text-center mt-2 mb-3">
                <button class="btn btn-block btn-spooky" @click="redirect">
                  Create New Account
                </button>
                <router-link to="#" class="btn btn-block btn-spooky">
                  Forgotten Password?
                </router-link>
              </div>
            </form>
          </div>
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
.container {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 5rem;
}
.text {
  color: white;
}
.login-page {
  background-image: linear-gradient(to right, #070707, rgb(74, 1, 1), black);
}
.login-box {
  border: 2px solid transparent;
  border-radius: 10px;
}
.btn-spooky {
  color: white;
  background-color: darkred;
}
.btn-spooky:hover {
  color: black;
  background-color: darkred;
}
/* Media Queries Medium Devices*/
@media screen and (max-width: 1024px) {
}

/* Media Queries Small Devices*/
@media screen and (max-width: 600px) {
  .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 2rem;
  }
  .login-box {
    width: 100%;
  }
}
</style>
