App.Scientist = Backbone.DeepModel.extend({
	urlRoot: '/api/v1/scientists',
	defaults: {
		first_name: "First Name",
		last_name: "Last Name",
		picture: {
			picture: {
				url: ""
			}
		},
		title: "Physical Biosciences Scientist",
		// slug should be un-alterable
		"profile.summary": ""
	},
	toJSON: function () {
		var clone = _.clone(this.attributes);
		var json = clone;
		var full_json = _.extend(clone, {profile_attributes: clone.profile});
		return full_json;
		//this.prototype.toJSON();
	}
});