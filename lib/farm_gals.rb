require "farm_gals/engine"
# 
# def use_farm_gals(uploader = FarmGalUploader)
  # has_many :gals, :as => :has_farm_gals
  # accepts_nested_attributes_for :gals
#   
# 
# end

def use_farm_gal(uploader)
  has_one :gal, :as => :has_farm_gals, :dependent => :destroy
  accepts_nested_attributes_for :gal
    
  GalImage.class_eval do 
    mount_uploader :src, uploader, dependent: :destroy
  end
end

module FarmGals
    PERMITTED_ATTRIBUTES = {:gal_attributes => [:id, :name, :main_image_id, :description, {:bulk_upload => []}, 
                            :gal_images_attributes => [:id, :caption, :src, :remote_src_url, :src_cache, :_destroy, :order, :description]]} 
end
