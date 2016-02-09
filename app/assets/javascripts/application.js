//= require jquery.min
//= require bootstrap
//= require weloveiconfonts_rails
//= require custom

$(document).ready(function() {
  changeMinHeightOnResize(".min-fullscreen", 0);

  var $window = $(window);
  var $navbar = $(".navigation .navbar");

  $("a.scroll").click(function() {
    $('.navbar-collapse').collapse('hide');
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
    }, 500);
    return false;
  });

  $('body').scrollspy({
    target: '.navbar-fixed-top'
  });

  $window.scroll(function(event) {
    if ($window.scrollTop() > 0) {
      $navbar.removeClass("transparent")
    } else {
      $navbar.addClass("transparent");
    }
  });
});
