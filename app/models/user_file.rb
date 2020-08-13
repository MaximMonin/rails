class UserFile < ApplicationRecord
  belongs_to :user, inverse_of: :user_files
end
