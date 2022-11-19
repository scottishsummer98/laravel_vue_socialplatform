<template>
  <div class="fb-profile-block">
    <div class="fb-profile-block-thumb">
      <img
        v-if="user.cp != null"
        :src="`../storage/${user.cp}`"
        alt=""
        title=""
        @click="CPOverlay"
      />
      <img v-else :src="`/${formData.CP}`" alt="" title="" />
      <a
        href="#"
        class="icon_profile_cp"
        title="Change Cover Picture"
        @click="editcp(user.id)"
      >
        <i class="fa fa-camera"></i>
      </a>
    </div>
    <div class="profile-img">
      <a href="#">
        <img
          v-if="user.dp != null"
          :src="`../storage/${user.dp}`"
          alt=""
          title=""
          @click="DPOverlay"
        />
        <img v-else :src="`/${formData.DP}`" alt="" title="" />
        <div
          class="icon_profile_dp"
          title="Change Profile Picture"
          @click="editdp(user.id)"
        >
          <i class="fa fa-camera"></i>
        </div>
      </a>
    </div>
    <div class="profile-name">
      <h2>{{ user.fname }} {{ user.lname }}</h2>
    </div>

    <div class="fb-profile-block-menu">
      <div class="block-menu">
        <ul>
          <li><a href="#">Timeline</a></li>
          <li><a href="#">Friends</a></li>
          <li><a href="#">Pages</a></li>
          <li><a href="#">Photos</a></li>
          <li><a href="#">Edit Profile</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div
    class="modal fade bd-example-modal-lg"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modaldpp"
  >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <form
          @submit.prevent
          method="post"
          id="myForm3"
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
                <img src id="target3" class="DP" />
              </div>
              <div class="form-group mt-5">
                <input
                  type="file"
                  class="form-control"
                  name="DP"
                  id="src3"
                  @input="showDPP"
                />
              </div>
            </div>
            <button class="btn btn-spooky btn-sm" @click="updateDP">
              Update
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div
    class="modal fade bd-example-modal-lg"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modalcp"
  >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <form
          @submit.prevent
          method="post"
          id="myForm2"
          enctype="multipart/form-data"
        >
          <div class="card">
            <h4 class="card-header">Upload New Cover Picture</h4>
            <div class="card-body">
              <div v-if="!imageSelected">
                <img
                  v-if="user.cp != null"
                  :src="`../storage/${user.cp}`"
                  class="CP"
                />
                <img v-else :src="`/${formData.CP}`" class="CP" />
              </div>
              <div class="CP" :class="!imageSelected ? 'hidden' : ''">
                <img src id="target2" class="CP" />
              </div>
              <div class="form-group mt-5">
                <input
                  type="file"
                  class="form-control"
                  name="CP"
                  id="src2"
                  @input="showCP"
                />
              </div>
            </div>
            <button class="btn btn-spooky btn-sm" @click="updateCP">
              Update
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div
    class="modal fade bd-example-modal-lg"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modalcpshow"
  >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div>
          <img :src="`../storage/${user.cp}`" class="img_Overlay" />
        </div>
      </div>
    </div>
  </div>
  <div
    class="modal fade bd-example-modal-sm"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modaldpshow"
  >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div>
          <img :src="`../storage/${user.dp}`" class="img_Overlay" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      formData: {
        id: '',
        DP: 'dist/img/blank_avatar.webp',
        CP: 'dist/img/blank_cover.jpg',
      },
      user: [],
      imageSelected: 0,
    }
  },
  methods: {
    DPOverlay() {
      $('#modaldpshow').modal('toggle')
    },
    CPOverlay() {
      $('#modalcpshow').modal('toggle')
    },
    showDPP() {
      this.imageSelected = 1
      var src = document.getElementById('src3')
      var target = document.getElementById('target3')
      var fr = new FileReader()
      fr.onload = function (e) {
        target.src = this.result
      }
      src.addEventListener('change', function () {
        fr.readAsDataURL(src.files[0])
      })
    },
    showCP() {
      this.imageSelected = 1
      var src = document.getElementById('src2')
      var target = document.getElementById('target2')
      var fr = new FileReader()
      fr.onload = function (e) {
        target.src = this.result
      }
      src.addEventListener('change', function () {
        fr.readAsDataURL(src.files[0])
      })
    },
    editdp(item) {
      this.formData.id = item
      $('#modaldpp').modal('toggle')
    },
    editcp(item) {
      this.formData.id = item
      $('#modalcp').modal('toggle')
    },
    updateDP() {
      this.errors = {}
      let myForm = document.getElementById('myForm3')
      let formData = new FormData(myForm)
      formData.append('id', this.formData.id)
      axios
        .post(`/update-user`, formData)
        .then((response) => {
          window.location.reload()
          this.isSubmitted = 0
          for (let key in this.formData) {
            if (key == 'DP') {
              this.formData[key] = 'dist/img/blank_avatar.webp'
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
      $('#modaldpp').modal('hide')
    },
    updateCP() {
      this.errors = {}
      let myForm = document.getElementById('myForm2')
      let formData = new FormData(myForm)
      formData.append('id', this.formData.id)
      axios
        .post(`/update-user`, formData)
        .then((response) => {
          window.location.reload()
          this.isSubmitted = 0
          for (let key in this.formData) {
            if (key == 'CP') {
              this.formData[key] = 'dist/img/blank_cover.jpg'
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
      $('#modalcp').modal('hide')
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
.fb-profile-block {
  margin: auto;
  position: relative;
  width: 850px;
}
img {
  width: 100%;
  height: auto;
}
.fb-profile-block-thumb {
  display: block;
  height: 315px;
  overflow: hidden;
  position: relative;
  text-decoration: none;
}
.fb-profile-block-menu {
  border: 1px solid #d3d6db;
  border-radius: 0 0 3px 3px;
}
.profile-img a {
  bottom: 15px;
  box-shadow: none;
  display: block;
  left: 15px;
  padding: 1px;
  position: absolute;
  height: 160px;
  width: 160px;
  background: rgba(0, 0, 0, 0.3) none repeat scroll 0 0;
  z-index: 9;
}
.profile-img img {
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.07);
  height: 158px;
  padding: 5px;
  width: 158px;
}
.profile-name {
  bottom: 60px;
  left: 205px;
  position: absolute;
}
.profile-name h2 {
  color: #fff;
  font-size: 24px;
  font-weight: 600;
  line-height: 30px;
  max-width: 275px;
  position: relative;
  text-transform: uppercase;
}
.fb-profile-block-menu {
  height: 44px;
  position: relative;
  width: 850px;
  overflow: hidden;
}
.block-menu {
  clear: right;
  padding-left: 205px;
}
.block-menu ul {
  margin: 0;
  padding: 0;
}
.block-menu ul li {
  display: inline-block;
}
.block-menu ul li a {
  border-right: 1px solid #e9eaed;
  float: left;
  font-size: 14px;
  font-weight: bold;
  height: 42px;
  line-height: 3;
  padding: 0 17px;
  position: relative;
  vertical-align: middle;
  white-space: nowrap;
  color: white;
  text-transform: capitalize;
  text-decoration: none;
}
.block-menu ul li:first-child a {
  border-left: 1px solid #e9eaed;
}
.icon_profile_cp {
  font-size: 25px;
  position: absolute;
  top: 85%;
  left: 95%;
  text-align: center;
  visibility: hidden;
  color: grey;
}
.icon_profile_dp {
  font-size: 25px;
  position: absolute;
  bottom: -1%;
  left: 78%;
  text-align: center;
  visibility: hidden;
  color: grey;
}
.fb-profile-block-thumb:hover .icon_profile_cp {
  color: white;
  transition: ease-in-out 0.5s;
  visibility: visible;
}

.profile-img:hover .icon_profile_dp {
  color: white;
  transition: ease-in-out 0.5s;
  visibility: visible;
}
.CP {
  padding: 10px;
  border: 1px solid transparent;
  width: 45rem;
  height: 20rem;
}
.img_Overlay {
  width: 50rem;
  height: 35rem;
}
.hidden {
  display: none;
}
</style>
