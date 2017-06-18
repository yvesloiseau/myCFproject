
var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};

$(document).on('turbolinks:load', function() {
    refreshRating();

  $('.img-zoom').elevateZoom({
          cursor: "crosshair",
          easing: true,
          zoomType: "lens",
          lensShape: "round",
          lensSize: 200
          }
      );
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});


});
