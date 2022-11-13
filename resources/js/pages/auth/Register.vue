<template class="hold-transition register-page">
  <div class="container">
    <div>
      <h1 class="text">Jinnbook</h1>
      <h4 class="text">
        Helps you connect and share with the jinns in your life.
      </h4>
    </div>
    <div style="width: 100%;">
      <div class="register-box">
        <div class="card card-outline">
          <div class="card-body">
            <div class="input-group mb-4">
              <input
                placeholder="First Name"
                id="name"
                type="text"
                class="form-control"
                v-model="formData.fname"
              />
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Last Name"
                id="name"
                type="text"
                class="form-control"
                v-model="formData.lname"
              />
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Date Of Birth"
                id="name"
                type="date"
                class="form-control"
                v-model="formData.dob"
              />
            </div>
            <div class="input-group mb-4">
              <select
                id="gender"
                class="form-control"
                v-model="formData.gender"
              >
                <option selected disabled>Select Country</option>
                <option value="M">Male</option>
                <option value="F">Female</option>
                <option value="O">Others</option>
              </select>
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Mobile Number"
                id="name"
                type="text"
                class="form-control"
                v-model="formData.mobile"
              />
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Email Address"
                id="email"
                type="text"
                class="form-control"
                v-model="formData.email"
              />
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Password"
                id="password"
                type="password"
                class="form-control"
                v-model="formData.password"
              />
            </div>
            <div class="input-group mb-4">
              <input
                placeholder="Retype Password"
                id="password-confirm"
                type="password"
                class="form-control"
                v-model="formData.password_confirmation"
              />
            </div>
            <div class="row">
              <div class="col-12">
                <button
                  type="submit"
                  class="btn btn-block btn-spooky"
                  @click="registerUser"
                >
                  Register
                </button>
              </div>
            </div>
            <div class="social-auth-links text-center">
              <button class="btn btn-block btn-spooky" @click="redirect">
                Already Registered?
              </button>
            </div>
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
          window.location.href = '/home'
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
.container {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 5rem;
}
.text {
  color: white;
}
.register-page {
  background-image: linear-gradient(to right, #070707, rgb(74, 1, 1), black);
}
.register-box {
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
  .register-box {
    width: 100%;
    padding: 0;
  }
}
</style>
