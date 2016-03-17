class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :logo
      t.string :url
      t.text :description
      t.boolean :published
      t.timestamps null: false
    end
  end
end
