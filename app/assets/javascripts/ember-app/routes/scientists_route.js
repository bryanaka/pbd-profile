var Scientist = require('../models/scientist');

var ScientistsRoute = Ember.Route.extend({

	model: function() {
		return Scientist.find();
	},
	renderTemplate: function() {
		this.render({ outlet: 'main' });
	}

});

module.exports = ScientistsRoute;

