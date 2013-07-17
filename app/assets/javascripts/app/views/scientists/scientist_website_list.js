var ScientistWebsiteListView = Backbone.View.extend({
	el: "#scientist_websites_list",
	events: {
		"click #action--DeleteWebsite": "deleteWebsite"
	},
	deleteWebsite: function (event) {
		websiteID = $(event.target).data('website-id');

	}
});