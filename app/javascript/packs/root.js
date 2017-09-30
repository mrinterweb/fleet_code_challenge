import Vue from 'vue/dist/vue.esm'
import App from './app.vue'
import { store } from './store/store'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app-root',
    components: { App },
    store
  })
})
