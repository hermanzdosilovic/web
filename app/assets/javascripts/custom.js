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
