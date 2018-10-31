class ChangeDatatypeUserIdOfUserfeatures < ActiveRecord::Migration[5.2]
  def change
    change_table :userfeatures do |t|
      t.remove :user_id
      t.references :user, foreign_key: true
    end
    change_table :foodhistories do |t|
      t.references :user, foreign_key: true
    end
  end
end
