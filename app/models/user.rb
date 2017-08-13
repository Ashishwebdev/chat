class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  has_many :chatroom_users ,dependent: :destroy
  has_many :chatrooms, through: :chatroom_users ,dependent: :destroy
  has_many :messages, dependent: :destroy
end
