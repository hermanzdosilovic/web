$(document).ready(function() {
  var navbarHeight = 0; // 62px but set to 0 because navbar is transparent
  $(window).resize(function() {
    $(".fullscreen").css("height", $(window).height() - navbarHeight);
    $(".min-fullscreen").css("min-height", $(window).height() - navbarHeight);
  });
  $(".fullscreen").css("height", $(window).height() - navbarHeight);
  $(".min-fullscreen").css("min-height", $(window).height() - navbarHeight);
});
