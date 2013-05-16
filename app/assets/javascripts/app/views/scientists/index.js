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
	},
	events: {
		"click .navigate-profile": "routeProfile"
	},
	routeProfile: function (event) {
		event.preventDefault();
		var href = $(event.target).closest('a').attr('href').split(/scientists\//);
		console.log(href[1]);
		router.navigate(href[1], { trigger: true } );
	}
});