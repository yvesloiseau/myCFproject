# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This one is working
$(document).on "turbolinks:load", ->
 $('.alert-danger').hide().delay(1000).fadeIn(2000).delay(2000).fadeOut(4000)

$(document).on "turbolinks:load", ->
 $('.alert-success').delay(4000).fadeOut(4000)

$(document).on "turbolinks:load", ->
 $('#notice').delay(4000).fadeOut(4000)