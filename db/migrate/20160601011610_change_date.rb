class ChangeDate < ActiveRecord::Migration
  def change
  	remove_column :dogs, :dateLost
  	remove_column :dogs, :dateFound
	add_column :dogs, :date, :date
  end
end
