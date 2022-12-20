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
        </ul>
      </div>
    </div>
  </div>
  <div class="timeline-profile-block" v-if="component == 'timeline'">
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
                <li @click="editOverlay(item)">Edit Post</li>
                <li @click="deleteOverlay(item.id, item.posttype)">
                  Delete Post
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div v-if="item.posttype == 'dp'" style="text-align: center;">
          <div v-if="item.desc == 'dp'">
            <img
              class="dpclass mt-3"
              :src="`../storage/${item.img}`"
              alt="DP Image"
              @click="PostImageOverlay(item.img)"
            />
          </div>
          <div v-else>
            <h4 style="text-align: justify; margin: 1rem 0;">
              {{ item.desc }}
            </h4>
            <img
              class="dpclass mt-3"
              :src="`../storage/${item.img}`"
              alt="DP Image"
              @click="PostImageOverlay(item.img)"
            />
          </div>
        </div>
        <div v-else-if="item.posttype == 'cp'" style="text-align: center;">
          <div v-if="item.desc == 'cp'">
            <img
              class="cpclass mt-3"
              :src="`../storage/${item.img}`"
              alt="CP Image"
              @click="PostImageOverlay(item.img)"
            />
          </div>
          <div v-else>
            <h4 style="text-align: justify; margin: 1rem 0;">
              {{ item.desc }}
            </h4>
            <img
              class="cpclass mt-3"
              :src="`../storage/${item.img}`"
              alt="CP Image"
              @click="PostImageOverlay(item.img)"
            />
          </div>
        </div>
        <div v-else>
          <div v-if="item.img == null">
            <h4 style="text-align: justify; margin: 1rem 0;">
              {{ item.desc }}
            </h4>
          </div>
          <div v-else>
            <h4 class="mt-3">
              {{ item.desc }}
            </h4>
            <img
              class="cpclass mt-3"
              :src="`../storage/${item.img}`"
              alt="Post Image"
              @click="PostImageOverlay(item.img)"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="friends-profile-block" v-if="component == 'friends'">
    <div>
      <h3 class="text-white">Friend Requests</h3>
      <div>
        <swiper :slides-per-view="4" :space-between="2">
          <swiper-slide v-for="(item, index) in friendreqlist" :key="index">
            <div>
              <img
                :src="`../storage/${item.dp}`"
                alt=""
                style="width: 12rem; height: 12rem; padding-bottom: 1rem;"
              />
              <h6 class="text-white">
                <router-link
                  :to="`/profile/${item.id}`"
                  style="text-decoration: none; color: white;"
                >
                  {{ item.fname }} {{ item.lname }}
                </router-link>
              </h6>
              <br />
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="aceeptFriend(item.id)"
              >
                Accept
              </button>
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="removeRequest(item.id)"
              >
                Remove
              </button>
            </div>
          </swiper-slide>
        </swiper>
      </div>
    </div>
    <br />
    <div>
      <h3 class="text-white">Friends</h3>
      <div>
        <swiper :slides-per-view="4" :space-between="2">
          <swiper-slide v-for="(item, index) in friendlist" :key="index">
            <div>
              <img
                :src="`../storage/${item.dp}`"
                alt=""
                style="width: 12rem; height: 12rem; padding-bottom: 1rem;"
              />
              <h6 class="text-white">
                <router-link
                  :to="`/profile/${item.id}`"
                  style="text-decoration: none; color: white;"
                >
                  {{ item.fname }} {{ item.lname }}
                </router-link>
              </h6>
              <br />
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="unfriend(item.id)"
              >
                Unfriend
              </button>
            </div>
          </swiper-slide>
        </swiper>
      </div>
    </div>
    <br />
    <div>
      <h3 class="text-white">Friend Suggestions</h3>
      <div>
        <swiper :slides-per-view="4" :space-between="2">
          <swiper-slide v-for="(item, index) in friendsugglist" :key="index">
            <div>
              <img
                :src="`../storage/${item.dp}`"
                alt=""
                style="width: 12rem; height: 12rem; padding-bottom: 1rem;"
              />
              <h6 class="text-white">
                <router-link
                  :to="`/profile/${item.id}`"
                  style="text-decoration: none; color: white;"
                >
                  {{ item.fname }} {{ item.lname }}
                </router-link>
              </h6>
              <br />
              <div v-if="item.pendingfriends != null">
                <button
                  v-if="item.pendingfriends.includes(user.id)"
                  class="btn btn-block btn-spooky"
                  style="border: 1px solid black;"
                  @click="cancelRequest(item.id)"
                >
                  Friend Request Sent
                </button>
                <button
                  v-else
                  class="btn btn-block btn-spooky"
                  style="border: 1px solid black;"
                  @click="addFriend(item.id)"
                >
                  Add Friend
                </button>
              </div>
              <div v-else>
                <button
                  class="btn btn-block btn-spooky"
                  style="border: 1px solid black;"
                  @click="addFriend(item.id)"
                >
                  Add Friend
                </button>
              </div>
            </div>
          </swiper-slide>
        </swiper>
      </div>
    </div>
  </div>
  <div class="pages-profile-block" v-if="component == 'pages'"></div>
  <div class="photos-profile-block" v-if="component == 'photos'">
    <div class="gallery-row">
      <div class="gallery-container">
        <h3 class="text-white">Profile Pictures</h3>
        <lightbox :items="dpimages"></lightbox>
      </div>
    </div>
    <div class="gallery-row mt-4">
      <div class="gallery-container">
        <h3 class="text-white">Cover Pictures</h3>
        <lightbox :items="cpimages"></lightbox>
      </div>
    </div>
    <div class="gallery-row mt-4">
      <div class="gallery-container">
        <h3 class="text-white">Uploaded Pictures</h3>
        <lightbox :items="timelineimages"></lightbox>
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
import lightbox from '../extra/Lightbox.vue'
import moment from 'moment'
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from 'swiper/vue'
// Import Swiper styles
import 'swiper/css'
import { showSuccess, showError } from '../helper'
export default {
  components: {
    lightbox,
    Swiper,
    SwiperSlide,
  },
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
        PP: '',
        DP: 'dist/img/blank_avatar.webp',
        CP: 'dist/img/blank_cover.jpg',
      },
      user: [],
      posts: {},
      friendreqlist: {},
      friendlist: {},
      friendsugglist: {},
      imageSelected: 0,
      postimageSelected: 0,
      imgsrc: '',
      postId: '',
      posttype: '',
      component: 'timeline',
      isEditingfname: false,
      isEditinglname: false,
      isEditingdob: false,
      isEditingemail: false,
      isEditingmobile: false,
      editingItem: {
        desc: '',
      },
      dpimages: [],
      cpimages: [],
      timelineimages: [],
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
    showDPGallery() {
      axios
        .post(`/show-posts?gtype=DP`)
        .then((response) => {
          this.dpimages = response.data
        })
        .catch((err) => {
          // console.log(err.response);
        })
    },
    showCPGallery() {
      axios
        .post(`/show-posts?gtype=CP`)
        .then((response) => {
          this.cpimages = response.data
        })
        .catch((err) => {
          // console.log(err.response);
        })
    },
    showTimeLineGallery() {
      axios
        .post(`/show-posts?gtype=timeline`)
        .then((response) => {
          this.timelineimages = response.data
        })
        .catch((err) => {
          // console.log(err.response);
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
    showAcceptedFriends(item) {
      axios
        .post(`/show-friends?type=acceptedreq`)
        .then((response) => {
          this.friendlist = response.data
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    authenticatedUser() {
      this.formData.id = this.$route.params.id
      axios.post(`/get-user?id=${this.formData.id}`).then((res) => {
        this.user = res.data
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
    this.showDPGallery()
    this.showCPGallery()
    this.showTimeLineGallery()
    this.showAcceptedFriends()
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
.PostImage {
  border: 1px solid white;
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
.dpclass {
  width: 30rem;
  height: 30rem;
}
.cpclass {
  width: 45rem;
  height: 25rem;
}
</style>
