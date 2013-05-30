App.ScientistTitle = Backbone.View.extend({
	el: "#scientistTitles",
	template: "",
	initialize: function() {
		var elManagerFactory = new Backbone.CollectionBinder.ElManagerFactory("<HTML TEMPLATE HERE>", "data-attr");
		this._collectionBinder = new Backbone.CollectionBinder(elManagerFactory);
	},
	render: function(){
		this.$el.html(this.template());
		this._collectionBinder.bind(this.collection, this.$('tbody'));
		return this;
	},
	close: function(){
		this._collectionBinder.unbind();
	},
	events: {
		"click #addTitle": "add",
		"click .removeTitle": "remove"
	},
	add: function () {

	},
	remove: function () {

	}
});