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
          <li><a href="#" @click="component = 'timeline'">Timeline</a></li>
          <li><a href="#" @click="component = 'friends'">Friends</a></li>
          <li><a href="#" @click="component = 'pages'">Pages</a></li>
          <li><a href="#" @click="component = 'photos'">Photos</a></li>
          <li><a href="#" @click="component = 'edit'">Edit Profile</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="timeline-profile-block" v-if="component == 'timeline'">
    <form
      @submit.prevent
      method="post"
      id="myForm5"
      enctype="multipart/form-data"
    >
      <div class="row">
        <div class="col-lg-1">
          <img
            class="timeline-img"
            v-if="user.dp != null"
            :src="`../storage/${user.dp}`"
            alt="User Image"
          />
          <img
            v-else
            :src="`/${formData.DP}`"
            class="timeline-img"
            alt="User Image"
          />
        </div>
        <div class="col-lg-8">
          <textarea
            rows="5"
            style="resize: none;"
            class="form-control"
            type="text"
            placeholder="What's on your mind?"
            v-model="formData.desc"
          ></textarea>
          <div class="CP" :class="!postimageSelected ? 'hidden' : ''">
            <img src id="target4" class="CP" />
          </div>
        </div>
        <div class="col-lg-3">
          <button class="btn-spooky" style="width: 100%;">
            <input
              type="file"
              id="src4"
              @input="showPostImage"
              value="Upload"
            />
          </button>
          <br />
          <br />
          <button class="btn-spooky" style="width: 100%;" @click="createPost">
            Post
          </button>
        </div>
      </div>
    </form>
    <div
      class="card mt-4"
      style="background-color: #320000; color: white;"
      v-for="(item, index) in posts"
      :key="index"
    >
      <div class="card-header">
        <div class="row" style="align-items: center;">
          <div class="col-lg-1">
            <img
              class="timeline-img"
              v-if="user.dp != null"
              :src="`../storage/${user.dp}`"
              alt="User Image"
            />
            <img
              v-else
              :src="`/${formData.DP}`"
              class="timeline-img"
              alt="User Image"
            />
          </div>
          <div class="col-lg-10">
            <h3 v-if="item.posttype == 'dp'">
              {{ user.fname }} {{ user.lname }} Updated the Profile Picture
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
            <h3 v-else-if="item.posttype == 'cp'">
              {{ user.fname }} {{ user.lname }} Updated the Cover Picture
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
            <h3 v-else>
              {{ user.fname }} {{ user.lname }} Posted a Status
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
          </div>
          <div class="col-lg-1">
            <div class="btn-group dropend">
              <button
                type="button"
                class="btn"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                style="border: none;"
              >
                <i class="fa-solid fa-ellipsis-vertical text-white"></i>
              </button>
              <ul class="p-2 dropdown-menu">
                <li>Edit Post</li>
                <li>Delete Post</li>
              </ul>
            </div>
          </div>
        </div>
        <div v-if="item.posttype == 'dp'" style="text-align: center;">
          <img
            class="dpclass"
            :src="`../storage/${item.img}`"
            alt="DP Image"
            @click="PostImageOverlay(item.img)"
          />
        </div>
        <div v-else-if="item.posttype == 'cp'" style="text-align: center;">
          <img
            class="cpclass"
            :src="`../storage/${item.img}`"
            alt="CP Image"
            @click="PostImageOverlay(item.img)"
          />
        </div>
        <div v-else>
          <div v-if="item.img == null">
            <h4 style="text-align: justify; margin: 1rem 4rem;">
              {{ item.desc }}
            </h4>
          </div>
          <div v-else>
            <h4>
              {{ item.desc }}
            </h4>
          </div>
        </div>
      </div>
      <div class="card-body"></div>
    </div>
  </div>
  <div class="friends-profile-block" v-if="component == 'friends'"></div>
  <div class="pages-profile-block" v-if="component == 'pages'"></div>
  <div class="photos-profile-block" v-if="component == 'photos'"></div>
  <div class="edit-profile-block" v-if="component == 'edit'">
    <form
      @submit.prevent
      method="post"
      id="myForm4"
      enctype="multipart/form-data"
    >
      <h4 class="text-white text-center">Account Information</h4>
      <hr class="text-white" style="border-width: 0.5rem;" />
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <label class="text-white mb-1" for="">First Name</label>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <input
            type="text"
            ref="fname"
            :value="formData.fname"
            :disabled="!isEditingfname"
            :class="{ view: !isEditingfname }"
          />
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2">
          <button
            class="btn-spooky mb-1"
            @click="
              ;(isEditingfname = !isEditingfname),
                (isEditinglname = false),
                (isEditingdob = false),
                (isEditingemail = false),
                (isEditingmobile = false)
            "
            v-if="!isEditingfname"
          >
            Edit
          </button>
          <button
            class="btn-spooky mb-1"
            @click="update"
            v-else-if="isEditingfname"
          >
            Save
          </button>
          <button
            class="btn-spooky mb-1"
            v-if="isEditingfname"
            @click="isEditingfname = false"
          >
            Cancel
          </button>
        </div>
      </div>
      <hr class="text-white" />
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <label class="text-white mb-1" for="">Last Name</label>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <input
            type="text"
            ref="lname"
            :value="formData.lname"
            :disabled="!isEditinglname"
            :class="{ view: !isEditinglname }"
          />
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2">
          <button
            class="btn-spooky mb-1"
            @click="
              ;(isEditingfname = false),
                (isEditinglname = !isEditinglname),
                (isEditingdob = false),
                (isEditingemail = false),
                (isEditingmobile = false)
            "
            v-if="!isEditinglname"
          >
            Edit
          </button>
          <button
            class="btn-spooky mb-1"
            @click="update"
            v-else-if="isEditinglname"
          >
            Save
          </button>
          <button
            class="btn-spooky mb-1"
            v-if="isEditinglname"
            @click="isEditinglname = false"
          >
            Cancel
          </button>
        </div>
      </div>
      <hr class="text-white" />
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <label class="text-white mb-1" for="">Date Of Birth</label>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <input
            v-if="!isEditingdob"
            type="text"
            ref="dob"
            :value="formData.dob"
            :disabled="!isEditingdob"
            :class="{ view: !isEditingdob }"
          />
          <input
            v-else
            type="date"
            ref="dob"
            :value="formData.dob"
            :disabled="!isEditingdob"
            :class="{ view: !isEditingdob }"
          />
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2">
          <button
            class="btn-spooky mb-1"
            @click="
              ;(isEditingfname = false),
                (isEditinglname = false),
                (isEditingdob = !isEditingdob),
                (isEditingemail = false),
                (isEditingmobile = false)
            "
            v-if="!isEditingdob"
          >
            Edit
          </button>
          <button
            class="btn-spooky mb-1"
            @click="update"
            v-else-if="isEditingdob"
          >
            Save
          </button>
          <button
            class="btn-spooky mb-1"
            v-if="isEditingdob"
            @click="isEditingdob = false"
          >
            Cancel
          </button>
        </div>
      </div>
      <hr class="text-white" />
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <label class="text-white mb-1" for="">Email</label>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <input
            type="email"
            ref="email"
            :value="formData.email"
            :disabled="!isEditingemail"
            :class="{ view: !isEditingemail }"
          />
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2">
          <button
            class="btn-spooky mb-1"
            @click="
              ;(isEditingfname = false),
                (isEditinglname = false),
                (isEditingdob = false),
                (isEditingemail = !isEditingemail),
                (isEditingmobile = false)
            "
            v-if="!isEditingemail"
          >
            Edit
          </button>
          <button
            class="btn-spooky mb-1"
            @click="update"
            v-else-if="isEditingemail"
          >
            Save
          </button>
          <button
            class="btn-spooky mb-1"
            v-if="isEditingemail"
            @click="isEditingemail = false"
          >
            Cancel
          </button>
        </div>
      </div>
      <hr class="text-white" />
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <label class="text-white mb-1" for="">Mobile No</label>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <input
            type="text"
            ref="mobile"
            :value="formData.mobile"
            :disabled="!isEditingmobile"
            :class="{ view: !isEditingmobile }"
          />
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2">
          <button
            class="btn-spooky mb-1"
            @click="
              ;(isEditingfname = false),
                (isEditinglname = false),
                (isEditingdob = false),
                (isEditingemail = false),
                (isEditingmobile = !isEditingmobile)
            "
            v-if="!isEditingmobile"
          >
            Edit
          </button>
          <button
            class="btn-spooky mb-1"
            @click="update"
            v-else-if="isEditingmobile"
          >
            Save
          </button>
          <button
            class="btn-spooky mb-1"
            v-if="isEditingmobile"
            @click="isEditingmobile = false"
          >
            Cancel
          </button>
        </div>
      </div>
    </form>
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
  <div
    class="modal fade bd-example-modal-sm"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modalpostimageshow"
  >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div>
          <img :src="`../storage/${imgsrc}`" class="img_Overlay" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import { showSuccess, showError } from '../helper'
export default {
  data() {
    return {
      formData: {
        id: '',
        fname: '',
        lname: '',
        dob: '',
        email: '',
        mobile: '',
        desc: '',
        img: '',
        DP: 'dist/img/blank_avatar.webp',
        CP: 'dist/img/blank_cover.jpg',
      },
      user: [],
      posts: {},
      imageSelected: 0,
      postimageSelected: 0,
      imgsrc: '',
      component: 'timeline',
      isEditingfname: false,
      isEditinglname: false,
      isEditingdob: false,
      isEditingemail: false,
      isEditingmobile: false,
    }
  },
  methods: {
    dateFormat(date) {
      return moment(date).format('MMMM Do YYYY, LT')
    },
    DPOverlay() {
      $('#modaldpshow').modal('toggle')
    },
    CPOverlay() {
      $('#modalcpshow').modal('toggle')
    },
    PostImageOverlay(item) {
      this.imgsrc = item
      $('#modalpostimageshow').modal('toggle')
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
    showPostImage() {
      this.postimageSelected = 1
      var src = document.getElementById('src4')
      var target = document.getElementById('target4')
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
    update() {
      this.errors = {}
      let myForm = document.getElementById('myForm4')
      let formData = new FormData(myForm)
      formData.append('id', this.formData.id)
      formData.append('fname', this.$refs['fname'].value)
      formData.append('lname', this.$refs['lname'].value)
      formData.append('dob', this.$refs['dob'].value)
      formData.append('email', this.$refs['email'].value)
      formData.append('mobile', this.$refs['mobile'].value)
      axios
        .post(`/update-user`, formData)
        .then((response) => {
          showSuccess('User Information Updated')
          this.isEditingfname = false
          this.isEditinglname = false
          this.isEditingdob = false
          this.isEditingemail = false
          this.isEditingmobile = false
          this.authenticatedUser()
        })
        .catch((err) => {
          if (err.response.status == 422) {
            this.errors = err.response.data.errors
          }
          showError(err.response.data.message)
        })
    },
    showPosts() {
      axios
        .post(`/show-posts`)
        .then((response) => {
          this.posts = response.data
        })
        .catch((err) => {
          // console.log(err.response);
        })
    },
    createPost() {
      this.errors = {}
      let myForm = document.getElementById('myForm5')
      let formData = new FormData(myForm)
      formData.append('id', this.formData.id)
      formData.append('desc', this.formData.desc)
      axios
        .post(`/create-post`, formData)
        .then((response) => {
          showSuccess('You posted an status!')
          this.isSubmitted = 0
          for (let key in this.formData) {
            if (key == 'img') {
              this.formData[key] = ''
              this.postimageSelected = 0
            } else {
              this.formData[key] = ''
            }
          }
          var src = document.getElementById('src')
          src.value = ''
          this.postimageSelected = 0
        })
        .catch((err) => {
          if (err.response.status == 422) {
            this.errors = err.response.data.errors
          }
          showError(err.response.data.message)
          this.imageSelected = 0
        })
      this.showPosts()
    },
    authenticatedUser() {
      axios.get('/api/user').then((res) => {
        this.user = res.data
        this.formData.id = res.data.id
        this.formData.fname = res.data.fname
        this.formData.lname = res.data.lname
        this.formData.dob = res.data.dob
        this.formData.email = res.data.email
        this.formData.mobile = res.data.mobile
      })
    },
  },
  mounted() {
    this.authenticatedUser()
    this.showPosts()
  },
}
</script>

<style>
.fb-profile-block {
  margin: auto;
  position: relative;
  width: 850px;
}
.timeline-profile-block {
  padding: 2rem;
  margin: auto;
  position: relative;
  width: 850px;
}
.friends-profile-block {
  padding: 2rem;
  margin: auto;
  position: relative;
  width: 850px;
}
.pages-profile-block {
  padding: 2rem;
  margin: auto;
  position: relative;
  width: 850px;
}
.photos-profile-block {
  padding: 2rem;
  margin: auto;
  position: relative;
  width: 850px;
}
.edit-profile-block {
  padding: 2rem;
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
.view {
  border-color: transparent;
  background-color: initial;
  color: white;
}
.timeline-img {
  border-radius: 50%;
  width: 3rem;
  height: 3rem;
}
.timeline-profile-block input {
  border-radius: 10px;
  width: 100%;
  height: 5rem;
}
.dpclass {
  width: 30rem;
  height: 30rem;
}
.cpclass {
  width: 45rem;
  height: 25rem;
}
</style>
