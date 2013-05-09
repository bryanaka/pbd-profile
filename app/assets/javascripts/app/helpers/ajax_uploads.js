if (FormData) {
	var form_data = new FormData();
	formData.append('user[avatar]', $input[0].files[0]);
 
	$.ajax({
		url: this.model.url(),
		data: formData,
		cache: false,
		contentType: false,
		processData: false,
		type: 'PUT'
	});

} else {
	// Write the iframe fallback method.
}