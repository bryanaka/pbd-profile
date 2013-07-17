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
		document.title = "Scientists || PBD Portal";
		scientist_card_list.render();
	}
});