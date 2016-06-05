class AddLostFound < ActiveRecord::Migration
  def change
  	add_column :dogs, :lostFound, :boolean
  end
end
