function load_handlebars_partial(partial_path) {
	template = $.get("/assets/app/templates/" + partial_path, function (data) {
		var source = data;
		var compiled = Handlebars.compile(source);
		return compiled;
	});
	return template;
}

window.App = {};
// routers
App.Router = Backbone.Router.extend({
	routes:{
		"":"index",
		":id/edit":"edit-scientist",
		"new":"edit-scientist"
	}
});
// collections
App.Scientists = Backbone.Collection.extend({
	url: '/api/v1/scientists'
});
App.Scientists.comparator = function(scientist) {
	return scientist.get("last_name");
};

App.Websites = Backbone.Collection.extend({

});

App.Titles = Backbone.Collection.extend({

});

// models
App.Scientist = Backbone.DeepModel.extend({
	urlRoot: '/api/v1/scientists',
	defaults: {
		first_name: "First Name",
		last_name: "Last Name",
		picture: {
			picture: {
				url: ""
			}
		},
		title: "Physical Biosciences Scientist"
		// slug should be un-alterable
	}
});

App.Website = Backbone.Model.extend({

});
App.Title = Backbone.Model.extend({

});
// views
App.ScientistIndexView = Backbone.View.extend({
	el: "#bb-container",
	render: function () {
		var that = this,
			scientists = new App.Scientists();
		scientists.fetch({
			success: function (scientists) {
				var data = scientists.toJSON()[0];
				console.log(data);
				var template = Handlebars.compile( $("#scientist-index-template").html() );
				that.$el.html( template(data) );
			}
		});
	}
});
var BindingHelpers = {
	patterns: {
		"open_p":	/^<p>/i,
		"close_p":	/<\/p>$/i,
		"br":		/<br>/i,
		"nbsp":    /&nbsp;/ig,
		"html":    /(<([^>]+)>)/ig
	},
	trim_p: function (direction, value) {
		var pattern1 = /^<p>/i;
		var pattern2 = /<\/p>$/i;
		var pattern3 = /<br>/i;
		var pattern4 = /&nbsp;/ig;
		var new_value = value.replace(pattern1, "");
		new_value = new_value.replace(pattern2, "");
		new_value = new_value.replace(pattern3, "");
		new_value = new_value.replace(pattern4, " ");
		return new_value;
	},
	strip_html: function (direction, value) {
		return value.replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/ig, "");
	}
};

App.ScientistEditView = Backbone.View.extend({
	initialize: function () {
		this._modelBinder = new Backbone.ModelBinder();
	},
	el: "#bb-container",
	bindings: {
		"first_name":"[name=scientist_first_name]",
		"last_name":"[name=scientist_last_name]",
		"profile.emphasis": {
			selector: "[name=scientist_profile_emphasis]",
			elAttribute: "html",
			converter: BindingHelpers.trim_p
		},
		"profile.company": {
			selector: "#profile_company",
			elAttribute: "text",
			converter: BindingHelpers.strip_html
		},
		"profile.address1": {
			selector: "#profile_address1",
			elAttribute: "text",
			converter: BindingHelpers.strip_html
		},
		"profile.address2": {
			selector: "#profile_address2",
			elAttribute: "text",
			converter: BindingHelpers.strip_html
		},
		"profile.city": {
			selector: "#profile_city",
			elAttribute: "text",
			converter: BindingHelpers.strip_html
		},
		"profile.email": {
			selector: "#profile_email",
			elAttribute: "text",
			converter: BindingHelpers.strip_html
		},
		"profile.summary": {
			selector: "#profile_summary",
			elAttribute: "html",
			converter: BindingHelpers.trim_p
		}
	},
	render: function(id) {
		var that = this,
			scientist = new App.Scientist();
		scientist.set('id', id).fetch({
			success: function (scientist) {
				var data = scientist.toJSON();
				console.log(data);
				var template = Handlebars.compile( $("#scientist-edit-template").html() );
				that.$el.html( template(data) );
				that._modelBinder.bind(scientist, that.el, that.bindings);
				console.log(that);
				Eventer.trigger("start_ckeditor", ".inline-editable");
				return that;
			}
		});
		window.testscientist = scientist;
		console.log("Model bound");
	}
});
// router stuff

var router = new App.Router();
router.on('route:index', function () {
	var scientist_index_view = new App.ScientistIndexView();
	scientist_index_view.render();
});
router.on('route:edit-scientist', function (id) {
	var scientist_edit_view = new App.ScientistEditView();
	scientist_edit_view.render(id);
});

//events
var Eventer = {};

_.extend(Eventer, Backbone.Events);

Eventer.on("start_ckeditor", function(selector) {
	CKEDITOR.disableAutoInline = true;
	CKEDITOR.inlineAll( $(selector) );
});

Backbone.history.start({pushState: true, root: "/scientists"});

