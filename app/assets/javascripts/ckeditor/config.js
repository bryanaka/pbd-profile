/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    //config.language = I18n.locale;
    // config.uiColor = '#AADC6E';

  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/pbdportal/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/pbdportal/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/pbdportal/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/pbdportal/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/pbdportal/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/pbdportal/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/pbdportal/ckeditor/attachment_files";

  // Rails CSRF token
  // config.filebrowserParams = function(){
  //   var csrf_token = jQuery('meta[name=csrf-token]').attr('content'),
  //       csrf_param = jQuery('meta[name=csrf-param]').attr('content'),
  //       params = {};

  //   if (csrf_param !== undefined && csrf_token !== undefined) {
  //     params[csrf_param] = csrf_token;
  //   }

  //   return params;
  // };
  // //
  // xhr.setRequestHeader("X-CSRF-Token", $("meta[name='csrf-token']").attr("content"));

  // config.addQueryString = function (url, params) {
  //   var queryString = [];

  //   if (!params)
  //     return url;
  //   else {
  //     for (var i in params)
  //       queryString.push(i + "=" + encodeURIComponent(params[ i ]));
  //   }

  //   return url + ( ( url.indexOf("?") != -1 ) ? "&" : "?" ) + queryString.join("&");
  // };

  // // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
  // CKEDITOR.on('dialogDefinition', function (ev) {
  //   // Take the dialog name and its definition from the event data.
  //   var dialogName = ev.data.name;
  //   var dialogDefinition = ev.data.definition;
  //   var content, upload;

  //   if ($.inArray(dialogName, ['link', 'image', 'attachment', 'flash']) > -1) {
  //     content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
  //     upload = (content === null ? null : content.get('upload'));

  //     if (upload && upload.filebrowser['params'] === null) {
  //       upload.filebrowser['params'] = config.filebrowserParams();
  //       upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
  //     }
  //   }
  // });

  /* Extra plugins */
  // works only with en, ru, uk locales
//  config.extraPlugins = "embed,attachment";

    //for orfografii
  config.disableNativeSpellChecker = false;
//  config.removePlugins = 'contextmenu';


  /* Toolbars */
//   config.toolbar = 'Mini';
//   config.toolbar_Mini =
//     [
//         ['Source','-','Preview'],
//         ['Cut','Copy','Paste','PasteText','PasteFromWord'],
//         ['Undo','Redo','-','SelectAll','RemoveFormat'],
// //        ['Styles','Format'],
//       ['Subscript', 'Superscript'],
// //      ['Subscript', 'Superscript', 'TextColor'],
// //        ['Maximize','-','About'],
//         ['Bold','Italic','Underline'], ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote']//,
// //        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
// //        ['Link','Unlink','Anchor'], ['Image', 'Attachment', 'Flash', 'Embed'],
// //        ['Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
//     ];

//   config.toolbar = 'VeryEasy';
//   config.toolbar_VeryEasy =
//     [
//         ['Source','-','Preview'],
//         ['Cut','Copy','Paste','PasteText','PasteFromWord'],
//         ['Undo','Redo','-','SelectAll','RemoveFormat'],
// //        ['Styles','Format'],
//       ['Subscript', 'Superscript', 'TextColor'],
//         ['Maximize','-','About'],
//         ['Bold','Italic','Underline','Strike'], ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
// //        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
// //        ['Link','Unlink','Anchor'], ['Image', 'Attachment', 'Flash', 'Embed'],
//         ['Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
//     ];

  // config.toolbar = 'Easy';
  // config.toolbar_Easy =
  //     [
  //       ['Source', '-', 'Preview'],
  //       ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
  //       ['Undo', 'Redo', '-', 'SelectAll', 'RemoveFormat'],
  //       ['Styles', 'Format'],
  //       ['Subscript', 'Superscript', 'TextColor'],
  //       ['Maximize', '-', 'About'],
  //       '/',
  //       ['Bold', 'Italic', 'Underline', 'Strike'],
  //       ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
  //       ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
  //       ['Link', 'Unlink', 'Anchor'],
  //       ['Image', 'Attachment', 'Flash', 'Embed'],
  //       ['Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak']
  //     ];

  config.toolbar = 'basic';
  config.toolbar_basic =
    [
        ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
        ['Undo', 'Redo'],
        ['Format','-', 'RemoveFormat'],
        ['Maximize', '-', 'About'],
        ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'TextColor'],
        '/',
        ['NumberedList', 'BulletedList'],
        ['Outdent', 'Indent', '-', 'Blockquote'],
        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['Link', 'Unlink', 'Anchor', 'Image'],
        ['Table', 'HorizontalRule', 'Smiley', 'SpecialChar']
    ];

  config.jqueryOverrideVal = true;
};