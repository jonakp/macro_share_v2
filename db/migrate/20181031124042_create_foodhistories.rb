class CreateFoodhistories < ActiveRecord::Migration[5.2]
  def change
    create_table :foodhistories do |t|
      t.string :name
      t.integer :calorie
      t.integer :protein
      t.integer :fat
      t.integer :carbo
      t.string :image_name

      t.timestamps
    end
  end
end
