$(document).on('turbolinks:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});

$(function() {

  $('#success').hide();
  $('#startover').addClass('hoverOut');
  var score = 0;

  $('#no-review').click(function() {
    $('#reviews').addClass('show-div').removeClass('hide-div');


  });

  $('#startover').hover(function() {
    score = 0;
    $('#score').text(score);
    $('#startover').addClass('hoverIn').removeClass('hoverOut');
  }, function() {
    $('#startover').removeClass('hoverIn').addClass('hoverOut');

  });


});