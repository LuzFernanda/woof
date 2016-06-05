class AddLocation < ActiveRecord::Migration
  def change
  	add_column :dogs, :calle, :string
  	add_column :dogs, :numero, :string
  	add_column :dogs, :colonia, :string
  	add_column :dogs, :ciudad, :string
  	add_column :dogs, :pais, :string
  	add_column :dogs, :codigoPostal, :string

  end
end
