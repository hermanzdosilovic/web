function changeHeightOnResize(selector, navbarHeight) {
  $(window).resize(function() {
    $(selector).css("height", $(window).height() - navbarHeight);
  });
  $(selector).css("height", $(window).height() - navbarHeight);
}

function changeMinHeightOnResize(selector, navbarHeight) {
  $(window).resize(function() {
    $(selector).css("min-height", $(window).height() - navbarHeight);
  });
  $(selector).css("min-height", $(window).height() - navbarHeight);
}

function navbarChangeColorOnScroll(selector) {
  var detached = false;
  var animationSpeed = 200;
  var navbarHeight = 62;
  $(window).scroll(function(event){
    if ($(window).width() < 768) {
      return;
    }
    var st = $(this).scrollTop();
    if (st > navbarHeight && detached === false) {
      $(selector).animate({
          backgroundColor: "rgba(62, 63, 58, 0.8)",
          borderColor: "rgba(62, 63, 58, 0.8)"
        },
        animationSpeed
      );
      detached = true;
    } else if (st <= navbarHeight) {
      $(selector).animate({
          backgroundColor: "transparent",
          borderColor: "transparent"
        },
        animationSpeed
      );
      detached = false;
    }
  });
}
