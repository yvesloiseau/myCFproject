
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

$("#comments").filter(":visible").each(function(){
  var path = $(this);
  $(this).load(path);
});

});
