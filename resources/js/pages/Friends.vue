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
  </div>
</template>

<style></style>
