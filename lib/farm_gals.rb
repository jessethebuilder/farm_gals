require "farm_gals/engine"

def use_farm_gals
  has_many :gals, :as => :has_farm_gals
  accepts_nested_attributes_for :gals
end

def use_farm_gal
  has_one :gal, :as => :has_farm_gals
  accepts_nested_attributes_for :gal
end

module FarmGals
    PERMITTED_ATTRIBUTES = {:gal_attributes => [:id, :name, :main_image_id, {:bulk_upload => []}, 
                            :gal_images_attributes => [:id, :caption, :src, :remote_src_url, :src_cache, :_destroy, :order, :description]]} 
end
