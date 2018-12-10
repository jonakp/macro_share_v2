class AddAvatarToFoodhistoryImages < ActiveRecord::Migration[5.2]
  def change
    add_column :foodhistory_images, :avatar, :string
  end
end
