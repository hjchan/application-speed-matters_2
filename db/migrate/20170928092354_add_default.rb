class AddDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :sum_point, 0
  end
end
