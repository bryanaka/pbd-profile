App.Scientists = Backbone.Collection.extend({
	//model: App.Scientist,
	url: '/api/v1/scientists'
});
App.Scientists.comparator = function(scientist) {
	return scientist.get("last_name");
};