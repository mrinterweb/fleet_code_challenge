<template>
  <tr>
    <td v-if="isEditing"><input v-model="rate.origin"></td>
    <td v-else>{{ rate.origin }}</td>

    <td v-if="isEditing"><input v-model="rate.destination"></td>
    <td v-else>{{ rate.destination }}</td>

    <td>{{ rate.flatRate }}</td>
    <td>{{ rate.flatRateCurrency }}</td>
    <td>{{ rate.name }}</td>

    <td v-if="isEditing"><input v-model="rate.rate"></td>
    <td v-else>{{ rate.rate }}</td>

    <td>{{ rate.rateUsd }}</td>
    <td>{{ rate.updatedAt }}</td>
    <td>
      <button v-if="isEditing" @click="saveRecord">Save</button>
      <button v-else @click="beginEditing">Edit</button>
    </td>
  </tr>
</template>

<script>
import ApplicationAdapter from '../adapters/application';

export default {
  data() {
    return {
      isEditing: false
    }
  },
  methods: {
    beginEditing() {
      this.isEditing = true;
    },
    saveRecord() {
      console.log('do some persistance')
      this.isEditing = false;
      let options = {
        data: {
          attributes: {
            origin: this.rate.origin,
            destination: this.rate.destination,
            rate: this.rate.rate
          },
          type: 'rates'
        },
      };
      new ApplicationAdapter().patch(this.rate.id, options).then((results) => {
        console.log(JSON.stringify(results));
        let index = _.findIndex(this.$store.state.rates, { id: results.data.id });
        this.$store.commit('UPDATE_RATE', { index: index, data: results.data.attributes });
      });
    }
  },
  name: 'editable',
  props: ['rate']
}
</script>

<style scoped>
</style>
