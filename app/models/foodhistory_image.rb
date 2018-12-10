class FoodhistoryImage < ApplicationRecord
  belongs_to :foodhistory
  mount_uploader :avatar, AvatarUploader
end
