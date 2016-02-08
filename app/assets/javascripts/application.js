//= require jquery.min
//= require jquery.color.min
//= require bootstrap
//= require weloveiconfonts_rails
//= require custom

$(document).ready(function(){
  navbarChangeColorOnScroll(".navigation .navbar");
  changeHeightOnResize(".fullscreen", 0);
  changeMinHeightOnResize(".min-fullscreen", 0);
});
