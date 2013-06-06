App.Scientist = Backbone.DeepModel.extend({
	paramRoot: 'scientist',
	urlRoot: '/pbdportal/api/v1/scientists/',
	defaults: {
		first_name: "First Name",
		last_name: "Last Name",
		picture: {
			picture: {
				url: ""
			}
		},
		title: "Staff Scientist",
		// slug should be un-alterable
		"profile.summary": ""
	}
});
