if (typeof(CKEDITOR) != 'undefined') {
            CKEDITOR.editorConfig = function( config )
            {
              config.toolbar = 'MyToolbar';

              config.toolbar_MyToolbar =
                [
                    { name: 'basicstyles', items : [ 'Bold','Italic' ] },
                    { name: 'links', items : [ 'Link','Unlink' ] },
                    { name: 'insert', items : [ 'Image' ] },
                    { name: 'paragraph', items : [ 'BulletedList' ] },
                    {name:'insert', items:['Smiley']}

                ];
            config.height = '80px';
            config.width = '100%'; 
   config.enterMode = CKEDITOR.ENTER_BR;
   config.shiftEnterMode = CKEDITOR.ENTER_BR;
   config.autoParagraph = false;
   config.removePlugins = 'elementspath, contextmenu, liststyle, tabletools,';
   config.resize_enabled = false;
}
}
