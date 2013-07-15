var Scientist = require('../models/scientist');

var ScientistsRoute = Ember.Route.extend({

	model: function() {
		return Scientist.find();
	}

});

module.exports = ScientistsRoute;

