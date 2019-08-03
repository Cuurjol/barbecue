// https://lokeshdhakar.com/projects/lightbox2/
// Фрагмент кода можно добавить в виде отдельного файла (например, lightbox2_options.js).
// Тогда в файле config/initializers/assets.rb нужно добавить следуюущую строчку:
// Rails.application.config.assets.precompile += %w(lightbox2_options.js)
// Данная строчка нужна для того, чтобы файл lightbox2_options.js был загружен на страницу браузера.
//
// Либо фрагмент кода следует добавить в файл app/assets/javascripts/application.js,
// чтобы он сразу был доступен на странице браузера.
$(function(){
  lightbox.option({
    resizeDuration: 300,
    fadeDuration: 300,
    imageFadeDuration: 300,
    wrapAround: true,
    albumLabel: 'Фотография %1 из %2'
  });
});
