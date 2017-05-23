
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
});

// Need to change the following code to hide and show some of the content
//  of my pages based on some conditions
