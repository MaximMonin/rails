class UserFile < ApplicationRecord
  validates :file, presence: true 
  validates :filename, presence: true 
  validates :filetype, presence: true 
  validates :filesize, numericality: { greater_than: 0 }

  belongs_to :user, inverse_of: :user_files
end
