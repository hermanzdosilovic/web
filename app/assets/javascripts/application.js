//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require modal_controller
//= require weloveiconfonts_rails
//= require jquery.easing
//= require clean-blog
//= norequire get-shit-done

$(document).ready(function(){
  $('body').on('click', '.page-scroll a', function(event) {
      var $anchor = $(this);
      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top
      }, 1500, 'easeInOutExpo');
      event.preventDefault();
  });
  $('body').on('click', '.navbar-custom',function(e) {
    if( $(e.target).is('a') ) {
        $('.navbar-collapse.in').collapse('hide');
    }
  });
  $('body').scrollspy({
    target: '.navbar-fixed-top'
  });

  window.onresize = function () {
    $('.fullscreen').css('height', $(window).height());
    $('.min-fullscreen').css('min-height', $(window).height());
  };
  $('.fullscreen').css('height', $(window).height());
  $('.min-fullscreen').css('min-height', $(window).height());

  $('body').on('click', '#mail', function() {
    $(this).attr('href', 'mailto:hermanz.dosilovic@gmail.com');
  });
});
