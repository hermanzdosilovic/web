//= require jquery.min
//= require jquery.color.min
//= require bootstrap
//= require weloveiconfonts_rails
//= require custom

$(document).ready(function(){
  var lastScrollTop = 0;
  var detached = false;
  var animationSpeed = 200;
  var navbarHeight = 62;
  $(window).scroll(function(event){
    if ($(window).width() < 768) {
      return;
    }
    var st = $(this).scrollTop();
    if (st > navbarHeight && detached === false) {
      $(".navigation .navbar").animate({
          backgroundColor: "rgba(62, 63, 58, 0.8)",
          borderColor: "rgba(62, 63, 58, 0.8)"
        },
        animationSpeed
      );
      detached = true;
    } else if (st <= navbarHeight) {
      $(".navigation .navbar").animate({
          backgroundColor: "transparent",
          borderColor: "transparent"
        },
        animationSpeed
      );
      detached = false;
    }
  });
});
