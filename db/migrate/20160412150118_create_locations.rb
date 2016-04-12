class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.string :content
      t.string :url
      t.references :brand, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
