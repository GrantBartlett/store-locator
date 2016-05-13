class ChangeLocations < ActiveRecord::Migration
  def change

    # Remove existing columns we no longer need
    remove_column :locations, :locale
    remove_column :locations, :name
    remove_column :locations, :region
    remove_column :locations, :content

    enable_extension "hstore"
    # Add new columns
    add_column :locations, :name, :hstore
    add_index :locations, :name, using: :gist

    add_column :locations, :region, :hstore
    add_index :locations, :region, using: :gist

    add_column :locations, :content, :hstore
    add_index :locations, :content, using: :gist

    add_column :locations, :opening_hours, :hstore
    add_index :locations, :opening_hours, using: :gist
  end
end
