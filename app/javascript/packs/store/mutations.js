import Vue from 'vue/dist/vue.esm'

export default {
  UPDATE_RATES(state, rates) {
    state.rates = rates;
  },

  UPDATE_RATE(state, payload) {
    let updated = _.merge(state.rates[payload.index], payload.data);
    Vue.set(state.rates, payload.index, updated);
  }
}
