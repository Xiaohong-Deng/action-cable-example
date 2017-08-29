App.chatrooms = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages_' + data.chatroom_id).removeClass 'hidden'
    $('#messages_' + data.chatroom_id).append this.renderMessage(data)

  renderMessage: (data) ->
    "<p> <b>" + data.user + ": </b>" + data.message + "</p>"

$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()
