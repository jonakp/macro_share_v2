class CreateFoodhistoryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :foodhistory_images do |t|

      t.timestamps
    end
  end
end
