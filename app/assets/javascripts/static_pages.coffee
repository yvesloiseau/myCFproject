# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This one is working
#setTimeout("$('.alert-danger').slideUp(2000).fadeOut('slow')", 4000)

#This does not work:
#jQuery ->
 # $('.alert-danger').hide().delay(4000).fadeIn(4800).delay(4000).fadeOut(4800)

# This one is working
$(document).on "turbolinks:load", ->
  $('.alert-danger').hide().delay(1000).fadeIn(2000).delay(2000).fadeOut(4000)
  #$('.alert-danger').delay(2000).fadeIn(2000).delay(2000).fadeOut(4000)

  # Having a javascript using the turbolinks event is working
  # See the alertMessages.js code as it would work:
#    (function() {
#    $(document).on("turbolinks:load", function() {
#      return $('.alert-danger').hide().delay(1000).fadeIn(2000).delay(2000).fadeOut(4000);
#      });
#
#    }).call(this);
