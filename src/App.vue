<script setup>
import Accordion from "primevue/accordion";
import AccordionPanel from "primevue/accordionpanel";
import AccordionHeader from "primevue/accordionheader";
import AccordionContent from "primevue/accordioncontent";
import { ref } from "vue";
const _count = ref(0);
const _names = ref([";,kf", "kmfekvf", "fjknvkejnv", "ovoevoerv", "lvkmrfvo"]);
</script>
<template>
  <div
    class="h-full w-full flex flex-col justify-center items-center space-y-20"
  >
    <span class="text-5xl text-purple-900 font-bold"> {{ _count }} </span>
    <p
      class="p-24 bg-[url(../assets/img/img.jpg)] bg-cover bg-center  rounded-full border-4 border-purple-950 text-3xl bg-purple-900 text-white/50 hover:bg-purple-950/20 cursor-pointer hover:scale-110 active:scale-90 hover:text-purple-950"
      @click="_count++"
    >
      ЖМИ
    </p>
    <Accordion value="0" class="!w-4/5">
      <AccordionPanel value="1" class="!w-full">
        <AccordionHeader class="!text-xl !text-center"> РЕЙТИНГ</AccordionHeader>
        <AccordionContent class="!w-full">
          <div class="w-full flex flex-col items-center">
            <div v-for="i in 5" class="flex flex-col w-full">
              <div class="flex items-center justify-between p-6">
                <span class="text-3xl">{{ i }}</span>
                <span class="text-3xl">
                  {{ _names[i - 1] }}
                </span>
              </div>

              <div v-if="i != 5" class="h-[.1rem] w-full bg-purple-950"></div>
            </div>
          </div>
        </AccordionContent>
      </AccordionPanel>
    </Accordion>
  </div>
</template>
