class Social < ApplicationRecord
 belongs_to :user
 attr_accessible :provider, :uid, :username, :email, :data
end
