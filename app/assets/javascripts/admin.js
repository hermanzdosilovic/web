//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require modal_controller
//= require weloveiconfonts_rails

$(document).ready(function() {
  $('body').on('click', '.navbar-custom',function(e) {
    if( $(e.target).is('a') ) {
        $('.navbar-collapse.in').collapse('hide');
    }
  });
});
