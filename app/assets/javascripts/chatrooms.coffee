# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#message_content").keyup ->
    if $("#message_content").val() != ""
      $("#submit_button").show()
    else
      $("#submit_button").hide()
