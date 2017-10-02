<template>
  <div id="app">
    <label>Origin</label>
    <select v-model="selectedOrigin">
      <option></option>
      <option v-for="option in availableOrigins" v-bind:value="option">{{option}}</option>
    </select>

    <label>Destination</label>
    <select v-model="selectedDestination">
      <option></option>
      <option v-for="option in availableDestinations" v-bind:value="option">{{option}}</option>
    </select>

    <table>
      <thead>
        <tr>
          <th>Origin Country</th>
          <th>Destination Country</th>
          <th>Flat Rate</th>
          <th>Currency</th>
          <th>Name</th>
          <th>Rate</th>
          <th>Rate USD</th>
          <th>Updated At</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <row v-for="rate in rates" :rate="rate"></row>
      </tbody>
    </table>
  </div>
</template>

<script>
import ApplicationAdapter from './adapters/application';
import Row from './components/row';

export default {
  data() {
    return {
      selectedOrigin: null,
      selectedDestination: null
    }
  },
  components: { Row },
  computed: {
    availableOrigins() {
      return document.availableOrigins;
    },
    availableDestinations() {
      return document.availableDestinations;
    },
    rates() {
      return this.$store.state.rates;
    }
  },
  methods: {
    updateRates() {
      let options = {
        query: {
          include: 'service-provider',
          filter: {}
        }
      };
      if (this.selectedOrigin) {
        options.query.filter.origin = this.selectedOrigin;
      }
      if (this.selectedDestination) {
        options.query.filter.destination = this.selectedDestination;
      }

      new ApplicationAdapter().get(options).then((results) => {
        // console.log(JSON.stringify(results))
        this.$store.dispatch('UPDATE_RATES', results)
      }).catch((error) => {
        debugger;
        console.error('whoopsie')
      })
    }
  },
  watch: {
    selectedOrigin() {
      this.updateRates()
    },
    selectedDestination() {
      this.updateRates();
    }
  },
  mounted() {
    this.updateRates();
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
