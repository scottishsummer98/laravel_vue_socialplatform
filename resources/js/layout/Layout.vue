<template>
  <div class="wrapper">
    <TopbarComponent></TopbarComponent>

    <SidebarComponent></SidebarComponent>

    <div class="content-wrapper">
      <div class="container-fluid">
        <router-view></router-view>
      </div>
    </div>

    <FooterComponent></FooterComponent>
  </div>
</template>

<script>
import TopbarComponent from './Topbar'
import SidebarComponent from './Sidebar'
import FooterComponent from './Footer'

export default {
  components: {
    TopbarComponent,
    SidebarComponent,
    FooterComponent,
  },
}
</script>

<style>
.container-fluid {
  background-image: url('../../../public/dist/img/BG.jpg');
  background-repeat: inherit;
}
</style>
