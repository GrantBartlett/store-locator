class AddCategoriesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :categories, :hstore
    add_index :locations, :categories, using: :gist
  end
end
