/* 
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved. 
For licensing, see LICENSE.html or http://ckeditor.com/license 
*/  
  
CKEDITOR.editorConfig = function( config )  
{  
config.language = 'zh-cn';  
    config.width = 900;  
    config.height = 500;  
    config.skin = 'kama';  
// 背景颜色  
    config.uiColor = '#BFEFFF';  
  config.toolbar_Full = [  
       ['Source','-','Save','NewPage','Preview','-','Templates'],  
       ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],  
       ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],  
       ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],  
       '/',  
       ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],  
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],  
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],  
        ['Link','Unlink','Anchor'],  
       ['Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],  
       '/',  
        ['Styles','Format','Font','FontSize'],  
        ['TextColor','BGColor']  
    ];  
    };  