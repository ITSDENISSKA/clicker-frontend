<script setup>
import { ref, onMounted, onUnmounted, onBeforeMount } from "vue";
// import "@/scripts/plus_one";
// const axios = require("axios");
import axios from "axios";

let intervalId = null;
const MAIN_URL = "https://ms.sdodo.ru/api/v1";
const user = ref({ user_id: 0, score: 0, speed: 0 });

const userId = 1; // Замените на нужный ID пользователя
const fetchUserData = async () => {
  try {
    const response = await axios.get(`${MAIN_URL}/scores/${userId}`);
    user.value = response.data;
    _count.value = response.data.score
    console.log(response.data, 11111111111111111111111111)
    // console.log(user.value, '-------------')

  } catch (error) {
    console.error("Error fetching user data:", error);
  }
};

onBeforeMount(() => {
  fetchUserData();
});


const _count = ref(user.value.score);

// console.log(user.value)
const container = ref(null);

const sendPatchRequest = () => {
  axios
    .patch(`${MAIN_URL}/scores`, {
      user_id: 1,
      score: _count.value,
      speed: 0,
    })
    .then((response => console.log(response.data)))
    .catch((error) => console.error(error));
};

onMounted(() => {
  // Запускаем интервал для отправки запроса каждые 10 секунд
  intervalId = setInterval(() => {
    sendPatchRequest();
  }, 10000); // 10000 миллисекунд = 10 секунд
});
onUnmounted(() => {
  // Очищаем интервал при размонтировании компонента
  if (intervalId) {
    clearInterval(intervalId);
  }
});




const func = function (event) {
  _count.value++;
  const rect = event.currentTarget.getBoundingClientRect();
  const plusOne = document.createElement("div");

  plusOne.classList.add("plus-one");
  plusOne.textContent = "+1";
  plusOne.style.left = `${event.clientX - rect.left}px`;
  plusOne.style.top = `${event.clientY - rect.top}px`;

  container.value.appendChild(plusOne);
  setTimeout(() => {
    plusOne.remove();
  }, 2000);
};


</script>
<template>
  <div class="relative h-5/6 w-full flex flex-col justify-center items-center">
    <span class="text-5xl text-purple-900 font-bold mb-20"> {{ _count }} </span>
    <!-- <span class="fade">+1</span> -->
    <p
      id="container"
      ref="container"
      @click="func"
      class="p-24 bg-[url(../assets/img/img.jpg)] bg-cover bg-center rounded-full border-4 border-purple-950 text-3xl bg-purple-900 text-white/50 hover:bg-purple-950/20 cursor-pointer hover:scale-110 active:scale-90 hover:text-purple-950"
    >
      ЖМИ
    </p>
  </div>
</template>

<style></style>
