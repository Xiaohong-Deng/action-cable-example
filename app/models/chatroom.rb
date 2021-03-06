class Chatroom < ApplicationRecord
  has_many :messages, class_name: "Message", dependent: :destroy
  has_many :user, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
