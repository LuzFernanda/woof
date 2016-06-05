class ChangeColumnType < ActiveRecord::Migration
  def change
  	remove_column :dogs, :reward
	add_column :dogs, :reward, :int
  end
end
