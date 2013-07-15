var ScientistProfile = require('../models/scientist_profile');

var ScientistProfileRoute = Ember.Route.extend({

	model: function() {
		return Profile.find();
	}

});

module.exports = ScientistProfileRoute;

