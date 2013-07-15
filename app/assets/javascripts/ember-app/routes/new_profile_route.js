var ScientistProfile = require('../models/scientist_profile');

var NewProfileRoute = Ember.Route.extend({

  renderTemplate: function() {
    this.render('edit_profile', {controller: 'new_profile'});
  },

  model: function() {
    return ScientistProfile.createRecord();
  },

  deactivate: function() {
    var model = this.get('controller.model');
    if (!model.get('isSaving')) {
      model.deleteRecord();
    }
  }

});

module.exports = NewProfileRoute;

