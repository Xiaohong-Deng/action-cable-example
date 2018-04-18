module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :message_user
    # connect gets called once connection is made, so it's a special method name
    def connect
      self.message_user = find_verified_user
      # prints out information about a user who has subscribed to a channel into the terminal
      logger.add_tags 'ActionCable', message_user.email
    end

    private
      def find_verified_user
        if verified_user = env['warden'].user
          verified_user
        else
          # action cable provides the method
          reject_unauthorized_connection
        end
      end
  end
end
