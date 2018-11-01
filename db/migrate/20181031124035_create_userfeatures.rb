class CreateUserfeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :userfeatures do |t|
      t.integer :user_id
      t.integer :height
      t.integer :weight
      t.integer :age
      t.integer :activity
      t.integer :purpose
      t.integer :total_calorie
      t.integer :protein
      t.integer :fat
      t.integer :carbo

      t.timestamps
    end
  end
end
