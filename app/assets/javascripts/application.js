// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require vendor/tinymce/tiny_mce
//= require vendor/underscore/underscore-min
//= require vendor/equalize/equalize.min.js
//= require vendor/handlebars/handlebars.min.js
//= require vendor/backbone/backbone-min
//= require vendor/backbone/backbone.marionette/backbone.marionette.min.js
//= require vendor/backbone/backbone.deep-model/backbone.deep-model.min.js
//= require vendor/backbone/backbone.modelbinder/backbone.modelbinder.min.js
//= require vendor/ckeditor/ckeditor.js
//= require app/app.js
//= require scientist
//= require vendor/intro/intro.js
//= require_self

(function(){
	var $flash = $('.flash_notice');
	$(function(){
		if ($flash !== []){
			setTimeout(function(){
				$flash.slideUp(600);
			}, 3000);
		}
	});
})();
