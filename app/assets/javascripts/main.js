document.addEventListener("turbolinks:load", function() {
  $('.flexslider').flexslider({
    animation: "slide",
    slideshow: true,
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
  $(window).on('resize', function(){
    console.log('window height:',$(document).height());
    
  });
});