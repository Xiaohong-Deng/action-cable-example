class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.paginate(page: params[:page], per_page: 5)
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:slug])
    @message = Message.new
  end
end
