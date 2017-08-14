module ApplicationCable
  class Connection < ActionCable::Connection::Base
  identified_by :current_user

    def connect
      self.current_user = cookies.signed[:username]
      logger.add_tags "ActionCable", "User #{current_user.id}"
    end


    protected
    def find_verified_user
      if current_user = User.find_by(id: cookies.signed[:user_id])
        current_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
