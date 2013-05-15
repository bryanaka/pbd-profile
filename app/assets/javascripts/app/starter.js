window.App = {};

//events
window.Eventer = {};

App.Router = Backbone.Router.extend({
	routes:{
		"":"index",
		":id/edit":"edit-scientist",
		"new":"edit-scientist",
		":id":"edit-scientist"
	}
});

var router = new App.Router();

_.extend(Eventer, Backbone.Events);

Eventer.on("start_ckeditor", function(selector) {
	CKEDITOR.disableAutoInline = true;
	CKEDITOR.inlineAll( $(selector) );
});
