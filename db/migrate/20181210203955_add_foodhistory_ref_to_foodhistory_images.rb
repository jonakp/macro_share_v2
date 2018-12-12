class AddFoodhistoryRefToFoodhistoryImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :foodhistory_images, :foodhistory, foreign_key: true, null: false
  end
end
