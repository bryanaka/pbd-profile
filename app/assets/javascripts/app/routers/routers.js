
router.on('route:index', function () {
	var scientist_index_view = new App.ScientistIndexView();
	if ( typeof introJs !== 'undefined' ){
		// throws an error if not active
		// introJs().exit();
	}
	$("#bb-container").fadeOut(500, function () {
		$(this).html('');
		$("#mainContent").removeClass('mainContent').addClass('mainContent--fitted').css('display', 'inline-block');
		$(".sideNav--fixed").animate({ "left":"0px" }, 500, "swing", function () {
			$(this).css('position', 'fixed');
			$("#bb-container").fadeIn(500);
		});
		document.querySelector('#mainContent').setAttribute('style', '');
		scientist_index_view.render();
	});
});
router.on('route:edit-scientist', function (id) {
	var scientist_edit_view = new App.ScientistEditView();
	// Messy as crap trasitions... 
	$("#bb-container").fadeOut(500, function () {
		$("#mainContent").removeClass('mainContent--fitted').addClass('mainContent').css('display', 'block');
		$(".sideNav--fixed").css({
			"position":"relative"
		})
		.animate({ "left":"-250px" }, 500, "swing", function () {
			$("#bb-container").fadeIn(500, function(){
				Eventer.trigger("start_ckeditor", ".inline-editable");
				$("#titles_sortable").sortable({
					handle:".sort-handle"
				});
				// styles are messed up for some reason.
				// introJs().start();
			});
		})
		.css({"position":"absolute"});

		scientist_edit_view.render(id);
	});
});
