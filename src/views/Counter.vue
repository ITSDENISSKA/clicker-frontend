<script setup>

import { ref } from "vue";
const _count = ref(0);

</script>
<template>

  <div
    class="h-5/6 w-full flex flex-col justify-center   items-center space-y-20"
  >
    <span class="text-5xl text-purple-900 font-bold"> {{ _count }} </span>
    <p
      class="p-24 bg-[url(../assets/img/img.jpg)] bg-cover bg-center  rounded-full border-4 border-purple-950 text-3xl bg-purple-900 text-white/50 hover:bg-purple-950/20 cursor-pointer hover:scale-110 active:scale-90 hover:text-purple-950"
      @click="_count++"
    >
      ЖМИ
    </p>
    
  </div>
</template>
