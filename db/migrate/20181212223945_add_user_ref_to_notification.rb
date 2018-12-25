class AddUserRefToNotification < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :user, foreign_key: true, null: false
    add_reference :notifications, :like, foreign_key: true, null: false
  end
end
