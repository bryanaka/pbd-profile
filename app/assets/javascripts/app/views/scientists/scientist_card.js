App.ScientistCardListView = Backbone.View.extend({
	el: "#scientists_list",
	template: Handlebars.compile( $("#scientist-card-template").html() ),
	initialize: function () {
		this.collection = new App.Scientists();
	},
	render: function () {
		var that = this;
		this.collection.fetch({
			success: function (scientists) {
				var scientists_data = scientists.toJSON();
				console.log(scientists_data);
				var buffer = "";
				_.each(scientists_data[0].scientists, function(scientist, index, list) {
					buffer += that.template(scientist);
				});
				that.$el.append(buffer);
			},
			error: function () {
				throw("Scientists/index didn't load correctly");
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