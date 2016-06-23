//= require jquery.min
//= require bootstrap
//= require weloveiconfonts_rails
//= require custom

$(document).ready(function() {
  changeMinHeightOnResize(".greeting", 0);
  changeMinHeightOnResize(".contact", 0);

  var $window = $(window);
  var $navbar = $(".navbar-default");

  $("a.scroll").click(function() {
    $('.navbar-collapse').collapse('hide');
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
    }, 500);
    return false;
  });

  $('body').scrollspy({
    target: '.navbar-default'
  });

  $window.scroll(function(event) {
    if ($window.scrollTop() > 0) {
      $navbar.removeClass("transparent")
    } else {
      $navbar.addClass("transparent");
    }
  });

  $('body').on('click', '#mail', function() {
    $(this).attr('href', 'mailto:hermanz.dosilovic@gmail.com');
  });
});
