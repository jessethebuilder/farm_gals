class GalImage < ActiveRecord::Base
  belongs_to :gal 
  default_scope { order(:order) }
  
  mount_uploader :src, FarmGalsUploader, dependent: :destroy
end
