import JQuery from 'jquery'

export default class {
  constructor() {
    this.URL = `/api/v1/rates`;
  };

  delete(id) {
    let options = { id: id };
    return this.request('DELETE', options);
  };

  get(options={}) {
    return this.request('GET', options);
  };

  patch(id, options={}) {
    options.id = id;
    return this.request('PATCH', options);
  };

  post(options={}) {
    return this.request('POST', options);
  };

  request(method, options={}) {
    let url = this.URL;
    let id = options.id;
    delete options.id;
    let query = options.query;
    delete options.query;

    if (id)    url += `/${id}`;
    if (query) url += '?' + JQuery.param(query);

    if (options.data) {
      if (id) options.data.id = id;
      options.data = JSON.stringify({ data: options.data });
    }

    let defaultOptions = {
      contentType: 'application/vnd.api+json',
      dataType: 'json',
      method: method,
      credentials: 'same-origin'
    }

    options = Object.assign({}, defaultOptions, options);
    console.log(`sending ${method} request to: ${url}`);

    return new Promise((resolve, reject) => {
      JQuery.ajax(url, options).done((data, status, jqXHR) => {
        resolve(data);
      }).fail((jqXHR, status, error) => {
        console.error(jqXHR.responseText);
        reject(error);
      })
    });
  }
};
