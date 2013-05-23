App.current_user = Backbone.Model.extend({
	defaults:{
		name: "name",
		email: "email@lbl.gov",
		eppn: "eppn",
		confirmed: false,
		scientist_id: false
	}
});