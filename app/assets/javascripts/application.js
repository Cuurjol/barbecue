//= require jquery
//= require rails-ujs
//= require twitter/bootstrap
//= require twitter/bootstrap/alert
//= require i18n/translations
//= require leaflet

$(function () {
  // https://stackoverflow.com/questions/44433953/jumping-scrollbar-after-auto-expanding-textarea
  let resizeTextarea = function(elem) {
    // two additional variables getting the top and left scroll positions.
    let scrollLeft = window.pageXOffset;
    let scrollTop  = window.pageYOffset;

    elem.css('height', 'auto').css('height', elem.prop('scrollHeight'));
    // Applying previous top and left scroll position after textarea resize.
    window.scrollTo(scrollLeft, scrollTop);
  };

  $('textarea').each(function() {
    $(this).on('input', function() {
      resizeTextarea($(this));
    });

    resizeTextarea($(this));
  })
});