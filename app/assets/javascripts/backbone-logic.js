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
		"":"index"
	}
});
// collections
App.Scientists = Backbone.Collection.extend({
	url: '/api/v1/scientists'
});

// models
App.Scientist = Backbone.Model.extend({
	urlRoot: '/api/v1/scientists'
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
				data.scientists = _.sortBy(data.scientists, "id");
				console.log(data);
				var template = Handlebars.compile( $("#scientist-index-template").html() );
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

Backbone.history.start({pushState: true, root: "/scientists"});

