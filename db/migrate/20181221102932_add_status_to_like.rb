class AddStatusToLike < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :status, :integer, null: false, default: 1
  end
end