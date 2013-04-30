# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

options =
	inputs:
		'scientist[first_name]':
			filters: 'required name'
		'scientist[last_name]':
			filters: 'required name'
		'scientist[slug]':
			filters: 'required name max',
			data:
				max: 20
		'prefix':{}
		'department':{}
		'department_url':
			filters: 'required url'
		'company':
			filters: 'required'
		'address1':
			filters: 'required'
		'address2':{}
		'city':
			filters: 'required'
		'state':{}
		'zip_code':
			filters: 'required zip'
		'phone1':
			filters: 'required phone'
		'phone2_type':{}
		'phone2':
			filters: ''
		'email':
			filters: 'required email'
		'summary':{}
		'emphasis':
			filters: 'required min',
			data:
				min: 20
		'publications_url':{}

jQuery ->
	$scientist_form = $("#scientist_form").idealforms(options).data('idealforms')

tinyMCE.init
	mode: "textareas",
	theme: "advanced",
	theme_advanced_buttons1: "mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,tablecontrols,undo,redo,link,unlink,image,cleanup,help,code",
	theme_advanced_resizing: true,
	theme_advanced_resize_horizontal: true,
	theme_advanced_resize_vertical: true,
	width:"30"
