<script setup>
import { ref, onMounted, onUnmounted, onBeforeMount } from "vue";
// import "@/scripts/plus_one";
// const axios = require("axios");
import axios from "axios";
let tg = window.Telegram.WebApp;

let intervalId = null;
const MAIN_URL = "https://ms.sdodo.ru/api/v1";
const user = ref({ user_id: 0, score: 0, speed: 0, username: '' });

const _user_id = tg.initDataUnsafe.user.id // уникальный идентификатор пользователя;
const _username = tg.initDataUnsafe.user.username; 

console.log()
// const _username = tg.initDataUnsafe.user.username;
const fetchUserData = async () => {
  try {
    const response = await axios.get(`${MAIN_URL}/scores/${_user_id}`);
    user.value = response.data;
    _count.value = response.data.score;
  } catch (error) {
    console.error("Error fetching user data:", error);
  }
};

onBeforeMount(async () => {
  await fetchUserData();
});

const _count = ref(user.value.score);

// console.log(user.value)
const container = ref(null);

const sendPatchRequest = async () => {
  await axios
    .patch(`${MAIN_URL}/scores`, {
      user_id: _user_id,
      score: _count.value,
      speed: 0,
      username: _username,
    })
    .then((response) => console.log(response.data))
    .catch((error) => console.error(error));
};

onMounted(async () => {
  // Запускаем интервал для отправки запроса каждые 10 секунд
  intervalId = setInterval(async () => {
    await sendPatchRequest();
  }, 3000); // 10000 миллисекунд = 10 секунд
});
onUnmounted(async () => {
  await sendPatchRequest();
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
    <div class="flex items-center mb-20 space-x-4">
      <!-- <img alt="fedyacoin" class="size-16" src="../assets/img/money.png" /> -->
      <span class="text-5xl text-green-100/80 font-stylish font">
        $ {{ _count }}
      </span>
    </div>
    <!-- <span class="fade">+1</span> -->
    <p
      id="container"
      ref="container"
      @click="func"
      class="hover:shadow-2xl shadow-xl p-32 bg-[url(../assets/img/img.png)] bg-cover bg-center rounded-full border-4 border-orange-300 text-3xl bg-orange-400 text-white/50 hover:bg-orange-400 cursor-pointer hover:scale-110 active:scale-90 hover:text-purple-950"
    ></p>
  </div>
</template>

<style>
.font {
  font-family: "Roboto Light", sans-serif;
  font-weight: bold;
}
</style>
