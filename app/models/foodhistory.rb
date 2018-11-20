class Foodhistory < ApplicationRecord
  belongs_to :user
  enum view_range_stat: { view_public: 0, view_private: 1 }
end
