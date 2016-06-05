class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :gender
      t.references :raza, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.date :dateFound
      t.date :dateLost
      t.text :characteristics
      t.boolean :collar
      t.boolean :reward
      t.text :photo
      t.integer :user_found_id
      t.integer :user_lost_id

      t.timestamps null: false
    end
  end
end
