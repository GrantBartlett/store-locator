class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.string :logo
      t.string :url
      t.text :description
      t.boolean :published
      t.timestamps null: false
    end
  end
end
