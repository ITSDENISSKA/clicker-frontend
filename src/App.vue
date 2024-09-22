<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>
<template>
  <div
    class="gradient-background h-full flex flex-col justify-between bg-white"
  >
    <RouterView class="h-full"></RouterView>
    <div class="bottom-0 w-full space-x-4 pb-6 pt-20 px-10 flex justify-between">
      <RouterLink to="/" class=" cursor-pointer px-4 ">
        <i class="pi pi-bitcoin !text-4xl hover:text-stone-400"></i>
      </RouterLink>

      <RouterLink to="/rating" class=" cursor-pointer px-4">
        <i class="pi pi-chart-bar !text-4xl hover:text-stone-400"></i>
      </RouterLink>
    </div>
  </div>
</template>
<style>
.gradient-background {
  background: #e69552a8;
  box-shadow: 0 -500px 300px -120px #3f6212ad inset;
  animation: background 10s infinite alternate;
}

@keyframes background {
  50% {
    background: #3f6212b4;
    box-shadow: 0 -500px 300px -100px #e69552ac  inset;
  }
}
</style>