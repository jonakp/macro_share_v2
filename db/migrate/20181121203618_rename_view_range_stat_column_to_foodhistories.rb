class RenameViewRangeStatColumnToFoodhistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :foodhistories, :view_range_stat, :mode
    change_column_null :foodhistories, :mode, false
    change_column_default :foodhistories, :mode, from: 1, to: 0
  end
end
