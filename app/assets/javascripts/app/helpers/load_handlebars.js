function load_handlebars_partial(partial_path) {
	template = $.get("/assets/app/templates/" + partial_path, function (data) {
		var source = data;
		var compiled = Handlebars.compile(source);
		return compiled;
	});
	return template;
}