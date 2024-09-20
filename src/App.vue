<script setup>
import { RouterLink, RouterView } from 'vue-router';
</script>
<template>
  <div class="h-full flex flex-col justify-between bg-green-400/50">

    <RouterView class="h-full"></RouterView>
    <div class=" bottom-0 w-full space-x-4 py-4 px-10 flex justify-between border-t border-purple-500 bg-orange-300">
      <RouterLink to="/" class="text-white  cursor-pointer px-4 bg-orange-300">
<i class="pi pi-bitcoin !text-4xl hover:text-blue-400
"></i>
      </RouterLink>

      <RouterLink to="/rating" class="text-white cursor-pointer px-4  bg-orange-300">
    <i class="pi pi-chart-bar !text-4xl  hover:text-blue-400
"></i>
      </RouterLink>
    </div>
  </div>
</template>