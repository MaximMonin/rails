class Social < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true 
  validates :provider, presence: true 
  validates :username, presence: true 
  validates :email, presence: true 
end
