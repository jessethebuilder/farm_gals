# This migration comes from farm_gals_engine (originally 20150906021236)
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
