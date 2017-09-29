class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sum_point, :integer
  end
end
