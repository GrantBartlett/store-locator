class AddLocaleToLocation < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :locations, :locale, :hstore
    add_index :locations, :locale, using: :gist
  end
end
