<script setup>
import {ref, onBeforeMount} from "vue"
// const _names = ref([";,kf", "kmfekvf", "fjknvkejnv", "ovoevoerv", "lvkmrfvo"]);
import axios from "axios";
const MAIN_URL = "https://ms.sdodo.ru/api/v1";

const _liders = ref([])
const fetchUserRating = async () => {
  try {
    const response = await axios.get(`${MAIN_URL}/scores/rating`);
    _liders.value = response.data;
    console.log(_liders.value, 22222222222222222)
    

  } catch (error) {
    console.error("Error fetching user data:", error);
  }
};
onBeforeMount(() => {
  fetchUserRating();
});
</script>

<template>
    <div class="flex flex-col justify-center space-y-20">
        <p class="text-4xl text-purple-800 text-center">РЕЙТИНГ</p>
        <div class="w-4/5 my-0 mx-auto flex flex-col items-center">
            <div v-for="(user, index) in _liders.slice(0, 5)" class="flex flex-col w-full">
              <div class="flex items-center justify-between p-6">
                <span class="text-xl">{{ index}}</span>
                <span class="text-xl">
                  {{ user.user_id }}
                </span>
                <span>
                    {{ user.score }}
                </span>
              </div>

              <div v-if="i != 5" class="h-[.1rem] w-full bg-purple-950"></div>
            </div>
          </div>
    </div>
</template>