//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require modal_controller
//= require weloveiconfonts_rails
//= require jquery.easing
//= require clean-blog
//= norequire get-shit-done

$(document).ready(function(){
  $(function() {
      $('body').on('click', '.page-scroll a', function(event) {
          var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: $($anchor.attr('href')).offset().top
          }, 1500, 'easeInOutExpo');
          event.preventDefault();
      });
  });
  $('.nav a').on('click', function(){
    $(".navbar-toggle").click()
  });
});
