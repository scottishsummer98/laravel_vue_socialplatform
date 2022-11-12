<template>
  <div class="wrapper">
    <TopbarComponent></TopbarComponent>

    <SidebarComponent></SidebarComponent>

    <div class="content-wrapper">
      <div class="content-header"></div>

      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <router-view></router-view>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <FooterComponent></FooterComponent>
  </div>
</template>

<script>
import TopbarComponent from '../BackEnd/Topbar'
import SidebarComponent from '../BackEnd/Sidebar'
import FooterComponent from '../BackEnd/Footer'

export default {
  components: {
    TopbarComponent,
    SidebarComponent,
    FooterComponent,
  },
}
</script>

<style></style>
