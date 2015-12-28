class CreateGalImages < ActiveRecord::Migration
  def change
    create_table :gal_images do |t|
      t.integer :gal_id
      t.string :caption
      t.text :description
      t.string :src
      t.integer :order
      
      t.timestamps null: false
    end
  end
end
