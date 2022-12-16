<template>
  <div class="timeline-profile-block">
    <div
      class="card mt-4"
      style="background-color: #320000; color: white;"
      v-for="(item, index) in posts"
      :key="index"
    >
      <div class="card-header">
        <div class="row" style="align-items: center;">
          <!-- <div class="col-lg-1">
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
          </div> -->
          <!-- <div class="col-lg-12">
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
          </div> -->
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
</template>

<script>
export default {
  data() {
    return {
      posts: {},
    }
  },
  methods: {
    showPosts() {
      axios
        .post(`/show-posts?gtype=newsfeed`)
        .then((response) => {
          this.posts = response.data
        })
        .catch((err) => {
          // console.log(err.response);
        })
    },
  },
  mounted() {
    this.showPosts()
  },
}
</script>

<style></style>
