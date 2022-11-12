<template>
  <div class="row">
    <HeaderComponent></HeaderComponent>

    <router-view></router-view>

    <FooterComponent></FooterComponent>
  </div>
</template>

<script>
import HeaderComponent from '../frontEnd/Header'
import FooterComponent from '../frontEnd/Footer'

export default {
  components: {
    HeaderComponent,
    FooterComponent,
  },
}
</script>

<style></style>
