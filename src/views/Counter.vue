<script setup>
import { ref, computed } from "vue";
// import "@/scripts/plus_one";
const _count = ref(0);
const container = ref(null)
const func = function (event) {
    _count.value++
    const rect = event.currentTarget.getBoundingClientRect()
    const plusOne = document.createElement("div");
    
    plusOne.classList.add("plus-one");
    plusOne.textContent = '+1';
    plusOne.style.left = `${event.clientX  - rect.left}px`
    plusOne.style.top = `${event.clientY  - rect.top}px`

    container.value.appendChild(plusOne);
    setTimeout(() => {
        plusOne.remove()
    }, 2000)
}

</script>
<template>
  <div
    class=" relative h-5/6 w-full flex flex-col justify-center items-center"
  >
    <span class="text-5xl text-purple-900 font-bold mb-20"> {{ _count }} </span>
    <!-- <span class="fade">+1</span> -->
    <p
    id="container"
    ref="container"

        @click="func"
      class=" p-24 bg-[url(../assets/img/img.jpg)] bg-cover bg-center rounded-full border-4 border-purple-950 text-3xl bg-purple-900 text-white/50 hover:bg-purple-950/20 cursor-pointer hover:scale-110 active:scale-90 hover:text-purple-950"
    >
      ЖМИ
    </p>
  </div>
</template>


<style>

</style>
