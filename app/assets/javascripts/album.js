$(document).ready(function() {
  $('a.fancybox').fancybox({
    type: "iframe",
    width        : 800,
    height       : 500,
    helpers     : {  
        title : { type : 'inside' },
        media : {}
      }
  });
});



