<script setup>
import { RouterLink, RouterView } from 'vue-router';
</script>
<template>
  <div class="h-full flex flex-col justify-between">
    
    <RouterView class="h-full"></RouterView>
    <div class=" bottom-0 w-full space-x-4 py-4 px-10 flex justify-between bg-purple-950">
      <RouterLink to="/"  class="bg-purple-950 text-white/80  cursor-pointer border border-purple-950 py-2 px-4 hover:bg-white/0 ">Главная</RouterLink>

      <RouterLink to="/rating" class="bg-purple-950 text-white/80  cursor-pointer border border-purple-950 py-2 px-4 hover:bg-white/0 ">Рейтинг</RouterLink>
    </div>
  </div>
</template>