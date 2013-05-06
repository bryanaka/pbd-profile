var App = {};
App.Router = Backbone.Router.extend({
	routes:{
		"":"index"
	}
});
//collections
App.Scientists = Backbone.Collection.extend({
	url: '/api/v1/scientists'
});