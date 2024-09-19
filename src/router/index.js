import { createRouter, createWebHistory } from 'vue-router'
import Counter from '@/views/Counter.vue'
import Rating from '@/views/Rating.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
        path: "/",
        component: Counter
    },
    {
        path: "/rating",
        component: Rating
    }

  ]
})

export default router
