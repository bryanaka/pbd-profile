var BindingHelpers = {
	patterns: {
		"open_p":	/^<p>/i,
		"close_p":	/<\/p>$/i,
		"br":		/<br>/i,
		"nbsp":    /&nbsp;/g,
		"html":    /(<([^>]+)>)/ig
	},
	trim_p: function (direction, value) {
		if (value === "" || value === "<p></p>" || value === "<p><br></p>") {
			var pattern1 = /^<p>/i;
			var pattern2 = /<\/p>$/i;
			var pattern3 = /<br>/i;
			var pattern4 = /&nbsp;/g;
			var new_value = value.replace(pattern1, "");
			new_value = new_value.replace(pattern2, "");
			new_value = new_value.replace(pattern3, "");
			new_value = new_value.replace(pattern4, " ");
			return new_value;
		} else {
			return value;
		}
	},
	strip_html: function (direction, value) {
		return value.replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/ig, "");
	},
	optional_add: function (direction, value) {
		var new_value = BindingHelpers.trim_p(direction, value);
		// this allows us to designate an area as option by using **optional** 
		if (new_value != null) {
			match = new_value.match(/.*\*\*optional\*\*.*/ig, "");
			if (match !== null || new_value === "<p>&nbsp;</p>"){
				return "";
			} else {
				return new_value;
			}
		} else {
			return "";
		}
	}
};