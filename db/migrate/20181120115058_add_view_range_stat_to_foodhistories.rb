class AddViewRangeStatToFoodhistories < ActiveRecord::Migration[5.2]
  def change
    add_column :foodhistories, :view_range_stat, :integer
  end
end
