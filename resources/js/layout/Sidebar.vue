<template>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img
            v-if="user.dp != null"
            :src="`../storage/${user.dp}`"
            class="img-circle elevation-2"
            alt="User Image"
          />
          <img
            v-else
            :src="`/${formData.DP}`"
            class="img-circle elevation-2"
            alt="User Image"
          />
          <a
            href="#"
            class="icon"
            title="Change Profile Picture"
            @click="edit(user.id)"
          >
            <i class="fa fa-camera"></i>
          </a>
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
  <div
    class="modal fade bd-example-modal-lg"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <form
          @submit.prevent
          method="post"
          id="myForm"
          enctype="multipart/form-data"
        >
          <div class="card">
            <h4 class="card-header">Upload New Profile Picture</h4>
            <div class="card-body">
              <div v-if="!imageSelected">
                <img
                  v-if="user.dp != null"
                  :src="`../storage/${user.dp}`"
                  class="DP"
                />
                <img v-else :src="`/${formData.DP}`" class="DP" />
              </div>
              <div class="DP" :class="!imageSelected ? 'hidden' : ''">
                <img src id="target" class="DP" />
              </div>
              <div class="form-group mt-5">
                <input
                  type="file"
                  class="form-control"
                  name="DP"
                  id="src"
                  @input="showImage"
                />
              </div>
            </div>
            <button class="btn btn-primary btn-sm" @click="updateDP">
              Update
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { showSuccess, showError } from '../helper'

export default {
  data() {
    return {
      formData: {
        id: '',
        DP: 'dist/img/blank_avatar.png',
      },
      user: [],
      imageSelected: 0,
    }
  },
  methods: {
    showImage() {
      this.imageSelected = 1
      var src = document.getElementById('src')
      var target = document.getElementById('target')

      var fr = new FileReader()

      fr.onload = function (e) {
        target.src = this.result
      }
      src.addEventListener('change', function () {
        fr.readAsDataURL(src.files[0])
      })
    },
    edit(item) {
      this.formData.id = item
      $('.modal').modal('toggle')
    },
    updateDP() {
      this.errors = {}
      let myForm = document.getElementById('myForm')
      let formData = new FormData(myForm)
      formData.append('id', this.formData.id)
      axios
        .post(`/update-user`, formData)
        .then((response) => {
          window.location.reload()
          this.isSubmitted = 0
          for (let key in this.formData) {
            if (key == 'DP') {
              this.formData[key] = 'dist/img/blank_avatar.png'
              this.imageSelected = 0
            } else {
              this.formData[key] = ''
            }
          }
          var src = document.getElementById('src')
          src.value = ''
          this.imageSelected = 0
        })
        .catch((err) => {
          if (err.response.status == 422) {
            this.errors = err.response.data.errors
          }
          showError(err.response.data.message)
          this.imageSelected = 0
        })
      $('.modal').modal('hide')
    },
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
.icon {
  font-size: 15px;
  position: absolute;
  top: 34%;
  left: 13%;
  text-align: center;
  visibility: hidden;
}
.image:hover .icon {
  visibility: visible;
}
.user-panel img {
  height: 2.1rem;
}
.DP {
  padding: 10px;
  border: 1px solid transparent;
  border-radius: 50%;
  width: 16rem;
  height: 16rem;
}
.hidden {
  display: none;
}
</style>
