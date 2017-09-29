class AddIndex < ActiveRecord::Migration
  def change
    add_index :points, :user_id
    add_index :users, :id
  end
end
