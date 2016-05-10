class AddRegionToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :region, :string
  end
end
