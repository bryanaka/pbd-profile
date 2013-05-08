# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tinyMCE.init
	mode: "textareas",
	theme: "advanced",
	theme_advanced_buttons1: "mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,tablecontrols,undo,redo,link,unlink,image,cleanup,help,code",
	theme_advanced_resizing: true,
	theme_advanced_resize_horizontal: true,
	theme_advanced_resize_vertical: true
	width:"30"

