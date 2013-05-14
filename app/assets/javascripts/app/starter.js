window.App = {};

//events
window.Eventer = {};

_.extend(Eventer, Backbone.Events);

Eventer.on("start_ckeditor", function(selector) {
	CKEDITOR.disableAutoInline = true;
	CKEDITOR.inlineAll( $(selector) );
});