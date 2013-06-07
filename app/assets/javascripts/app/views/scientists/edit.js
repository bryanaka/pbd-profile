App.ScientistEditView = Backbone.View.extend({
	initialize: function () {
		this._modelBinder = new Backbone.ModelBinder();
	},
	el: "#bb-container",
	bindings: {
		"first_name":"[name=scientist_first_name]",
		"last_name":"[name=scientist_last_name]",
		"title": {
			selector: "#scientist_primary_title",
			elAttribute: "html"
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
		"profile.state": {
			selector:"#profile_state",
			elAttribute:"text"
		},
		"profile.zip_code": {
			selector:"#profile_zip_code",
			elAttribute:"text"
		},
		"profile.phone1": {
			selector:"#profile_phone1",
			elAttribute:"text"
		},
		"profile.phone2_type": {
			selector:"#profile_phone2_type",
			elAttribute:"text"
		},
		"profile.phone2": {
			selector:"#profile_phone2",
			elAttribute:"text"
		},
		"profile.email": {
			selector: "#profile_email",
			elAttribute: "text"
		},
		"profile.emphasis": {
			selector: "[name=scientist_profile_emphasis]",
			elAttribute: "html"
			// the trim p helper is creating problems with the CKeditor
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
		"click #action--Save":"saveProfile",
		"click #action--Back":"gotoPortal"
	},
	fix_ckeditor: function (event) {
		// need to figure out how to fix the responsive problem with ckeditor
		//$('.cke').css('top', '');
	},
	saveProfile: function (event) {
		event.preventDefault();
		this.model.save({}, {
			success: function () {
				var $message = $("#notificationBar");
				$message.text("Successfully Saved!");
				$message.slideDown(600);
				function slider() {
					$message.slideUp();
				}
				setTimeout(slider, 5000);
			},
			error: function () {
				var $message = $("#notificationBar");
				$message.text("There was an error when saving.");
				$message.toggleClass('notifications--error');
				$message.slideDown(600);
				function slider() {
					$message.slideUp();
				}
				setTimeout(slider, 5000);
			}
		});
	},
	gotoPortal: function (event) {
		event.preventDefault();
		if (history) {
			history.back();
		} else {
			window.location = "//" + window.location.host + "/pbdportal";
		}
	}
});