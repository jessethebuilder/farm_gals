class Gal < ActiveRecord::Base
  belongs_to :has_farm_gals, polymorphic: true
  
  has_many :gal_images
  accepts_nested_attributes_for :gal_images
end
