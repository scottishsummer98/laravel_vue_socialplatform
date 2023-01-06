<template>
  <div class="fb-profile-block" v-for="(item, index) in user" :key="index">
    <div class="fb-profile-block-thumb">
      <img :src="`../storage/${item.cp}`" alt="" title="" />
    </div>
    <div class="profile-img">
      <a href="#">
        <img :src="`../storage/${item.dp}`" alt="" title="" />
      </a>
    </div>
    <div class="profile-name">
      <h2>{{ item.fname }} {{ item.lname }}</h2>
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
              :src="`../storage/${dpimg}`"
              alt="User Image"
            />
          </div>
          <div class="col-lg-11">
            <h3 v-if="item.posttype == 'dp'">
              {{ fname }} {{ lname }} Updated the Profile Picture
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
            <h3 v-else-if="item.posttype == 'cp'">
              {{ fname }} {{ lname }} Updated the Cover Picture
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
            <h3 v-else>
              {{ fname }} {{ lname }} Posted a Status
              <br />
              <h6>{{ dateFormat(item.created_at) }}</h6>
            </h3>
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
                  v-if="authuser.id == item.id"
                  to="/profile"
                  style="text-decoration: none; color: white;"
                >
                  {{ item.fname }} {{ item.lname }}
                </router-link>
                <router-link
                  v-else
                  :to="`/profile/${item.id}`"
                  style="text-decoration: none; color: white;"
                >
                  {{ item.fname }} {{ item.lname }}
                </router-link>
              </h6>
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
    class="modal fade bd-example-modal-sm"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modalpostimageshow"
  >
    <div class="modal-dialog modal-lg">
      <div
        v-for="(item, index) in imageInfo"
        :key="index"
        style="
          left: -50%;
          width: 200%;
          position: absolute;
          background-color: #320000;
          color: white;
        "
      >
        <div class="row">
          <div class="col-lg-6">
            <img
              style="height: 30rem; width: 50rem;"
              :src="`../storage/${item.img}`"
              alt=""
            />
          </div>
          <div class="col-lg-6">
            <div class="col-lg-1" style="top: 8%;">
              <img
                class="timeline-img"
                v-if="item.dp != null"
                :src="`../storage/${item.dp}`"
                alt="User Image"
              />
              <img
                v-else
                :src="`/${formData.DP}`"
                class="timeline-img"
                alt="User Image"
              />
            </div>
            <div class="col-lg-11" style="top: -2%; left: 8%;">
              <h3 v-if="item.posttype == 'dp'">
                {{ item.fname }} {{ item.lname }} Updated the Profile Picture
                <br />
                <h6>{{ dateFormat(item.created_at) }}</h6>
              </h3>
              <h3 v-else-if="item.posttype == 'cp'">
                {{ item.fname }} {{ item.lname }} Updated the Cover Picture
                <br />
                <h6>{{ dateFormat(item.created_at) }}</h6>
              </h3>
              <h3 v-else>
                {{ item.fname }} {{ item.lname }} Posted a Status
                <br />
                <h6>{{ dateFormat(item.created_at) }}</h6>
              </h3>
            </div>
            <div class="col-lg-12 mt-3">
              <h4 v-if="item.desc == 'dp' || item.desc == 'cp'"></h4>
              <h4 v-else>
                {{ item.desc }}
              </h4>
            </div>
          </div>
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
      },
      authuser: [],
      fname: '',
      lname: '',
      dpimg: '',
      user: {},
      posts: {},
      friendlist: {},
      imageInfo: {},
      imgsrc: '',
      postId: '',
      posttype: '',
      component: 'timeline',
      dpimages: [],
      cpimages: [],
      timelineimages: [],
    }
  },
  methods: {
    dateFormat(date) {
      return moment(date).format('MMMM Do YYYY, LT')
    },
    UserInfo() {
      this.formData.id = this.$route.params.id
      axios.post(`/get-user?id=${this.formData.id}`).then((res) => {
        this.user = res.data.UserInformation
        this.fname = res.data.UserInformation[0].fname
        this.lname = res.data.UserInformation[0].lname
        this.dpimg = res.data.UserInformation[0].dp
        this.posts = res.data.PostsList
        this.dpimages = res.data.DPImages
        this.cpimages = res.data.CPImages
        this.timelineimages = res.data.GPImages
        this.friendlist = res.data.UserfriendsList
      })
    },
    authenticatedUser() {
      axios.get('/api/user').then((res) => {
        this.authuser = res.data
      })
    },
    PostImageOverlay(item) {
      this.imgsrc = item
      axios
        .post(`/show-posts?gtype=lightbox&img=${this.imgsrc}`)
        .then((response) => {
          this.imageInfo = response.data
        })
        .catch((err) => {
          // console.log(err.response);
        })
      $('#modalpostimageshow').modal('toggle')
    },
  },
  mounted() {
    this.UserInfo()
    this.authenticatedUser()
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
