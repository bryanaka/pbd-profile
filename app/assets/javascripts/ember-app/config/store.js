// by default, persist application data to localStorage.
require('../vendor/localstorage_adapter');

DS.RESTAdapter.reopen({
  namespace: 'pbdportal/api/v1'
});

module.exports = DS.Store.extend({
  revision: 11,
  adapter: DS.RESTAdapter.create()
  //adapter: DS.LSAdapter.create()
});

