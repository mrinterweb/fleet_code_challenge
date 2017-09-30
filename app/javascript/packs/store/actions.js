import _ from 'lodash';

export default {
  UPDATE_RATES({ commit }, results) {
    if (results.data && results.data.length === 0) {
      commit('UPDATE_RATES', []);
    } else {
      let mapAtributes = function(_val, key) {
        return _.camelCase(key);
      };

      let rates = results.data.map((d) => {
        let rate = _.mapKeys(d.attributes, mapAtributes);
        rate.id = d.id;
        rate.serviceProviderId = d.relationships['service-provider'].data.id;

        let serviceProvider = _.find(results.included, { type: 'service-providers', id: rate.serviceProviderId });

        if (serviceProvider) {
          rate = _.merge(rate, _.mapKeys(serviceProvider.attributes, mapAtributes));
        }

        return rate;
      });

      commit('UPDATE_RATES', rates);
    }
  }
}
