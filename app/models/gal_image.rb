class GalImage < ActiveRecord::Base
  belongs_to :gal
  
  validates :src, presence: true
  
  use_farm_slugs :id_method => :caption
  
  before_validation do 
    self.caption = "image" if self.caption.blank?
  end
  
  mount_uploader :src, FarmGalsUploader, dependent: :destroy
end
