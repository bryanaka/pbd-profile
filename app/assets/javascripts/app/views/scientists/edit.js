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
			elAttribute: "text"
		},
		"profile.address1": {
			selector: "#profile_address1",
			elAttribute: "text"
		},
		"profile.address2": {
			selector: "#profile_address2",
			elAttribute: "text"
		},
		"profile.city": {
			selector: "#profile_city",
			elAttribute: "text"
		},
		"profile.email": {
			selector: "#profile_email",
			elAttribute: "text"
		},
		"profile.summary": {
			selector: "#profile_summary",
			elAttribute: "html",
			converter: BindingHelpers.optional_add
		}
	},
	render: function(id) {
		var that = this;
		this.model = new App.Scientist();
		this.model.set('id', id).fetch({
			success: function (scientist) {
				var data = scientist.toJSON();
				var template = Handlebars.compile( $("#scientist-edit-template").html() );
				that.$el.html( template(data) );
				that._modelBinder.bind(that.model, that.el, that.bindings);
				return that;
			}
		});
		window.testscientist = this.model;
	},
	events: {
		"blur .inline-editable":"fix_ckeditor",
		"click #save":"saveProfile"
	},
	fix_ckeditor: function (event) {
		$(event.target).css('top', '');
	},
	saveProfile: function (event){
		event.preventDefault();
		this.model.save();
	}
});