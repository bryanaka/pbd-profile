App.Scientists = Backbone.Collection.extend({
	url: '/api/v1/scientists'
});
App.Scientists.comparator = function(scientist) {
	return scientist.get("last_name");
};