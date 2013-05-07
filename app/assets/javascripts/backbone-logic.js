function load_handlebars_partial(partial_path) {
	template = $.get("/assets/app/templates/" + partial_path, function (data) {
		var source = data;
		var compiled = Handlebars.compile(source);
		return compiled;
	});
	return template;
}

window.App = {};
// routers
App.Router = Backbone.Router.extend({
	routes:{
		"":"index",
		":id/edit":"edit-scientist",
		"new":"edit-scientist"
	}
});
// collections
App.Scientists = Backbone.Collection.extend({
	url: '/api/v1/scientists'	
});
App.Scientists.comparator = function(scientist) {
	return scientist.get("last_name");
};

// models
App.Scientist = Backbone.Model.extend({
	urlRoot: '/api/v1/scientists',
	defaults: {
		first_name: "",
		last_name: "",
		picture: {
			picture: {
				url: ""
			}
		},
		title: "Scientist"
		// slug should be un-alterable
	}
});

// views
App.ScientistIndexView = Backbone.View.extend({
	el: "#bb-container",
	render: function () {
		var that = this,
			scientists = new App.Scientists();
		scientists.fetch({
			success: function (scientists) {
				var data = scientists.toJSON()[0];
				console.log(data);
				var template = Handlebars.compile( $("#scientist-index-template").html() );
				that.$el.html( template(data) );
			}
		});
	}
});
App.ScientistEditView = Backbone.View.extend({
	el: "#bb-container",
	render: function(id) {
		var that = this,
			scientist = new App.Scientist();
		scientist.set('id', id).fetch({
			success: function (scientist) {
				var data = scientist.toJSON();
				console.log(data);
				var template = Handlebars.compile( $("#scientist-edit-template").html() );
				that.$el.html( template(data) );
			}
		});
	}
});

var router = new App.Router();
router.on('route:index', function () {
	var scientist_index_view = new App.ScientistIndexView();
	scientist_index_view.render();
});
router.on('route:edit-scientist', function (id) {
	
	var scientist_edit_view = new App.ScientistEditView();
	scientist_edit_view.render(id);
});
Backbone.history.start({pushState: true, root: "/scientists"});

