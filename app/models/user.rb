class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
#  devise :omniauthable, omniauth_providers: [:facebook, :google]

  validates :username, presence: true 
  has_many :chat_messages, dependent: :destroy, inverse_of: :user
  has_many :user_files, dependent: :destroy, inverse_of: :user

  has_one_attached :photo

  after_save :checkchanges

  private

  def checkchanges
    phone_verified_at = nil if phone_changed?
  end
end
