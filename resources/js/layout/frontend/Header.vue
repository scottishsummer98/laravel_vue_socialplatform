<template>
  Header Layout
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">
        <router-link
          to="/"
          style="color: black;"
          data-toggle="collapse"
          active-class="active border-top border-white"
        >
          Home
        </router-link>
      </a>
    </nav>
  </div>
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">
        <router-link
          to="/about"
          style="color: black;"
          data-toggle="collapse"
          active-class="active border-top border-white"
        >
          About
        </router-link>
      </a>
    </nav>
  </div>
</template>

<script>
export default {}
</script>

<style></style>
