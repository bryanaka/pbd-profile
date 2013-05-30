App.ScientistTitle = Backbone.View.extend({
	el: "#titles_sortable",
	template: Handlebars.compile( $("#scientist-title-template").html() ),
	initialize: function() {
		var elManagerFactory = new Backbone.CollectionBinder.ElManagerFactory(this.template(), "data-attribute");
		this._collectionBinder = new Backbone.CollectionBinder(elManagerFactory);
	},
	render: function(){
		this.$el.html(this.template());
		this._collectionBinder.bind(this.collection, this.$el);
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