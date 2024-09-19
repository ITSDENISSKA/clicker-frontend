<script setup>
import {ref} from "vue"
const _names = ref([";,kf", "kmfekvf", "fjknvkejnv", "ovoevoerv", "lvkmrfvo"]);
</script>

<template>
    <div class="flex flex-col justify-center space-y-20">
        <p class="text-4xl text-purple-800 text-center">РЕЙТИНГ</p>
        <div class="w-4/5 my-0 mx-auto flex flex-col items-center">
            <div v-for="i in 5" class="flex flex-col w-full">
              <div class="flex items-center justify-between p-6">
                <span class="text-xl">{{ i }}</span>
                <span class="text-xl">
                  {{ _names[i - 1] }}
                </span>
                <span>
                    23243434343
                </span>
              </div>

              <div v-if="i != 5" class="h-[.1rem] w-full bg-purple-950"></div>
            </div>
          </div>
    </div>
</template>