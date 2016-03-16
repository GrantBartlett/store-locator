class CreateBrandLocations < ActiveRecord::Migration
  def change
    create_table :brand_locations do |t|

      t.timestamps null: false
    end
  end
end
