class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  validates :username, presence: true 
  has_many :chat_messages, dependent: :destroy, inverse_of: :user
  has_many :user_files, dependent: :destroy, inverse_of: :user
end
