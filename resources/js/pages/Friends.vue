<template>
  <div class="friends-profile-block">
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
</template>

<script>
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from 'swiper/vue'
// Import Swiper styles
import 'swiper/css'
import { showSuccess, showError } from '../helper'
export default {
  components: {
    Swiper,
    SwiperSlide,
  },
  data() {
    return {
      user: [],
      friendreqlist: {},
      friendlist: {},
      friendsugglist: {},
    }
  },
  methods: {
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
    aceeptFriend(item) {
      axios
        .post(`/add-remove-friends?type=accept&id=${item}`)
        .then((response) => {
          this.showAcceptedFriends()
          this.showPendingFriends()
          this.showFriendSuggestions()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    addFriend(item) {
      axios
        .post(`/add-remove-friends?type=add&id=${item}`)
        .then((response) => {
          this.showAcceptedFriends()
          this.showPendingFriends()
          this.showFriendSuggestions()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    unfriend(item) {
      axios
        .post(`/add-remove-friends?type=unfriend&id=${item}`)
        .then((response) => {
          this.showAcceptedFriends()
          this.showPendingFriends()
          this.showFriendSuggestions()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    removeRequest(item) {
      axios
        .post(`/add-remove-friends?type=removereq&id=${item}`)
        .then((response) => {
          this.showAcceptedFriends()
          this.showPendingFriends()
          this.showFriendSuggestions()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    cancelRequest(item) {
      axios
        .post(`/add-remove-friends?type=cancelreq&id=${item}`)
        .then((response) => {
          this.showAcceptedFriends()
          this.showPendingFriends()
          this.showFriendSuggestions()
        })
        .catch((err) => {
          showError('Someting went wrong!')
        })
    },
    authenticatedUser() {
      axios.get('/api/user').then((res) => {
        this.user = res.data
      })
    },
  },
  mounted() {
    this.authenticatedUser()
    this.showAcceptedFriends()
    this.showPendingFriends()
    this.showFriendSuggestions()
  },
}
</script>
