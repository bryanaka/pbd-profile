(function() {
    options = {
        'inputs': {
            'video[title]': {
                filters: 'required'
            },
            'video[date(1i)]': {
                filters: 'required'
            },
            'video[date(2i)]': {
                filters:'required'
            },
            'video[date(3i)]': {
                filters: 'required'
            },
            'video[scientist]': {
                filters: 'required'
            },
            'video[vid_link]': {
                filters: 'required'
            }
        }
    };

    $scientist_form = $('#video_form').idealforms(options).data('idealforms');

    tinyMCE.init({
        mode: "textareas",
        theme: "advanced",
        // theme_advanced_buttons1: "mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,tablecontrols,undo,redo,link,unlink,image,cleanup,help,code",
        theme_advanced_resizing: true,
        theme_advanced_resize_horizontal: true,
        theme_advanced_resize_vertical: true,
        width:"30"
    });
}());