App.current_user = Backbone.Model.extend({
	paramRoot: 'scientist',
	urlRoot: '/pbdportal/api/v1/current_user',
	defaults:{
		name: "name",
		email: "email@lbl.gov",
		eppn: "eppn",
		confirmed: false,
		scientist_id: false
	}
});