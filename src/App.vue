<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>
<template>
  <div
    class="gradient-background h-full flex flex-col justify-between bg-white overflow-hidden"
  >
    <RouterView class="h-full"></RouterView>
    <div class="bottom-0 absolute w-full space-x-4 pb-6 pt-20 px-10 flex justify-between">
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
  background: #e69552aa;
  box-shadow: 0 -500px 500px -120px #3f621280 inset;
  animation: background 7s infinite alternate;
}

@keyframes background {
  50% {
    background: #3f62129e;
    box-shadow: 0 -500px 500px -100px #e69552bd  inset;
  }
}
</style>