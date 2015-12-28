class CreateGals < ActiveRecord::Migration
  def change
    create_table :gals do |t|
      t.integer :main_image_id
      t.string :name
      t.string :has_farm_gals_type
      t.integer :has_farm_gals_id

      t.timestamps null: false
    end
  end
end
