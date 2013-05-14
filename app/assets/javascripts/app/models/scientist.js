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
	}
});