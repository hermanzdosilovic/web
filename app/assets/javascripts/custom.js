$(document).ready(function() {
  var navbar_height = 62;
  $(window).resize(function() {
    $(".fullscreen").css("height", $(window).height() - navbar_height);
    $(".min-fullscreen").css("min-height", $(window).height() - navbar_height);
  });
  $(".fullscreen").css("height", $(window).height() - navbar_height);
  $(".min-fullscreen").css("min-height", $(window).height() - navbar_height);
});
