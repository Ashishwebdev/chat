class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatroom:#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
