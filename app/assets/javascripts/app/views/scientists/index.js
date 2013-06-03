App.ScientistIndexView = Backbone.View.extend({
	el: "#bb-container",
	template: $("#scientist-index-template").html(),
	initialize: function () {
		this.collection = new App.Scientists();
	},
	render: function () {
		this.$el.empty();
		this.$el.append(this.template);
		var scientist_card_list = new App.ScientistCardListView();
		scientist_card_list.render();
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