class GalImage < ActiveRecord::Base
  belongs_to :gal 
  use_farm_slugs :id_method => :caption
  
  mount_uploader :src, FarmGalsUploader, dependent: :destroy
  
  after_save :do_not_save_with_blank_src
  
  private
  
  def do_not_save_with_blank_src
    self.destroy if src.blank?
  end
end
