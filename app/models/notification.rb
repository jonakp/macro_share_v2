class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :like
end
