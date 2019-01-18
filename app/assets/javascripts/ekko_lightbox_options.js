// http://ashleydw.github.io/lightbox/
// Фрагмент кода можно добавить в виде отдельного файла (например, ekko_lightbox_options.js).
// Тогда в файле config/initializers/assets.rb нужно добавить следуюущую строчку:
// Rails.application.config.assets.precompile += %w(ekko_lightbox_options.js)
// Данная строчка нужна для того, чтобы файл ekko_lightbox_options.js был загружен на страницу браузера.
//
// Либо фрагмент кода следует добавить в файл app/assets/javascripts/application.js,
// чтобы он сразу был доступен на странице браузера.
$(document).on('click', '[data-toggle="lightbox"]', function (event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});