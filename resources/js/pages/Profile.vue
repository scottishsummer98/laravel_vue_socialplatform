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
        <div class="col-lg-9">
          <input
            type="file"
            name="PP"
            id="src4"
            @input="showPostImage"
            style="color: white; position: absolute; top: 55px;"
          />
          <textarea
            rows="3"
            style="resize: none;"
            class="form-control"
            type="text"
            placeholder="What's on your mind?"
            v-model="formData.desc"
          ></textarea>
          <div class="PostImage" :class="!postimageSelected ? 'hidden' : ''">
            <img src id="target4" class="PostImage" />
          </div>
        </div>
        <div class="col-lg-2">
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
              <h6 class="text-white">{{ item.fname }} {{ item.lname }}</h6>
              <br />
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="AddFriends(item.id)"
              >
                Accept
              </button>
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
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
              <h6 class="text-white">{{ item.fname }} {{ item.lname }}</h6>
              <br />
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="RemoveFriends(item.id)"
              >
                Unfriend
              </button>
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
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
              <h6 class="text-white">{{ item.fname }} {{ item.lname }}</h6>
              <br />
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
                @click="AddFriends(item.id)"
              >
                Add Friend
              </button>
              <button
                class="btn btn-block btn-spooky"
                style="border: 1px solid black;"
              >
                Remove
              </button>
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
  <div
    class="modal fade bd-example-modal-sm"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true"
    id="modaldeleteconfirmation"
  >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">
            Are you sure you want to delete this post?
          </h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-spooky" data-bs-dismiss="modal">
            No
          </button>
          <button type="button" class="btn btn-spooky" @click="deletePost">
            Yes
          </button>
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
    id="modaleditconfirmation"
  >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-body">
          <div class="row">
            <div class="col-lg-6">
              <textarea
                rows="5"
                class="form-control"
                v-model="editingItem.desc"
              ></textarea>
            </div>
            <div class="col-lg-6">
              <img
                class="PostImage"
                :src="`../storage/${editingItem.img}`"
                alt="Post Image"
              />
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-spooky" data-bs-dismiss="modal">
            Cancel
          </button>
          <button type="button" class="btn btn-spooky" @click="updatePost">
            Update
          </button>
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
    editOverlay(item) {
      for (let index in item) {
        this.editingItem[index] = item[index]
      }
      $('#modaleditconfirmation').modal('toggle')
    },
    deleteOverlay(ptid, pttype) {
      this.postId = ptid
      this.posttype = pttype
      $('#modaldeleteconfirmation').modal('toggle')
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
          window.location.reload()
          for (let key in this.formData) {
            if (key == 'PP') {
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
          showError('Someting went wrong!')
          this.postimageSelected = 0
        })
    },
    updatePost() {
      axios
        .post(
          `/update-post?postid=${this.editingItem.id}&desc=${this.editingItem.desc}`,
        )
        .then((res) => {
          showSuccess('Post has been Edited')
          window.location.reload()
        })
        .catch((err) => {
          showError('Something went wrong!')
        })
      $('#modaleditconfirmation').modal('hide')
    },
    deletePost(item) {
      axios
        .post(`/delete-post?postid=${this.postId}&posttype=${this.posttype}`)
        .then((response) => {
          showSuccess('Post Deleted Successfully')
          window.location.reload()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
      $('#modaldeleteconfirmation').modal('hide')
    },
    showFriendSuggestions(item) {
      axios
        .post(`/show-friends?type=suggestions`)
        .then((response) => {
          this.friendsugglist = response.data
        })
        .catch((err) => {
          showError('Someting went wrong!')
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
    showPendingFriends(item) {
      axios
        .post(`/show-friends?type=pendingreq`)
        .then((response) => {
          this.friendreqlist = response.data
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    // AddFriends(item) {
    //   axios
    //     .post(`/add-remove-friends?type=add&id=${item}`)
    //     .then((response) => {
    //       this.showAcceptedFriends()
    //       this.showPendingFriends()
    //       this.showFriendSuggestions()
    //     })
    //     .catch((err) => {
    //       showError('Someting went wrong!')
    //     })
    // },
    // RemoveFriends(item) {
    //   axios
    //     .post(`/add-remove-friends?type=remove&id=${item}`)
    //     .then((response) => {
    //       this.showAcceptedFriends()
    //       this.showPendingFriends()
    //       this.showFriendSuggestions()
    //     })
    //     .catch((err) => {
    //       showError('Someting went wrong!')
    //     })
    // },
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
    this.showDPGallery()
    this.showCPGallery()
    this.showTimeLineGallery()
    this.showAcceptedFriends()
    this.showPendingFriends()
    this.showFriendSuggestions()
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
