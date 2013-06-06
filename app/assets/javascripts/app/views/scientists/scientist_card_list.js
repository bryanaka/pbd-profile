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
				// render all scientists if user is admin
				if ( AppSettings.has_role('admin') ) {
					var buffer = "";
					_.each(scientists_data[0].scientists, function(scientist, index, list) {
						buffer += that.template(scientist);
					});
					that.$el.append(buffer);
				} else {
					// render only one scientist if scientist role
					if ( AppSettings.current_user.scientist_id !== null ) {
						var matched_scientist = _.findWhere(scientists_data[0].scientists, { id: AppSettings.current_user.scientist_id } );
						console.log(matched_scientist);
						var html = that.template(matched_scientist);
						that.$el.append(html);
					} else {
					// Render nothing if the scientist doesn't have a profile
						that.$el.append("<h3>You are not able to edit any profiles at this time</h3>");
					}
				}
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
