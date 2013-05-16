
router.on('route:index', function () {
	var scientist_index_view = new App.ScientistIndexView();
	if ( typeof introJs !== 'undefined' ){
		introJs().exit();
	}
	$("#bb-container").fadeOut(600, function () {
		$(".sideNav--fixed").css({
			"position":"relative"
		})
		.animate({ "left":"0px" }, 600, "swing", function () {
			$("#bb-container").fadeIn(600);
		});
		document.querySelector('.mainContent--scientist').setAttribute('style', '');
		scientist_index_view.render();
	});
});
router.on('route:edit-scientist', function (id) {
	var scientist_edit_view = new App.ScientistEditView();
	// Messy as crap trasitions... 
	$("#bb-container").fadeOut(600, function () {
		$(".sideNav--fixed").css({
			"position":"relative"
		})
		.animate({ "left":"-250px" }, 600, "swing", function () {
			$("#bb-container").fadeIn(600, function(){
				Eventer.trigger("start_ckeditor", ".inline-editable");
				$("#titles_sortable").sortable({
					handle:".sort-handle"
				});
				introJs().start();
			});
		})
		.css({"position":"absolute"});
		$(".mainContent--scientist").css({
			"width":"100%",
			"max-width":"100%"
		});
		scientist_edit_view.render(id);
	});
});
