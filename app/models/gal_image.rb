class GalImage < ActiveRecord::Base
  belongs_to :gal 
  use_farm_slugs :id_method => :caption
  
  # before_validation do 
    # # because it uses farm slugs. 
    # self.caption = "image" if self.caption.blank?
  # end
 
  # validates :src, :presence => true 
  mount_uploader :src, FarmGalsUploader, dependent: :destroy
  
  after_save :do_not_save_with_blank_src
  
  private
  
  def do_not_save_with_blank_src
    self.destroy if src.blank?
  end
  
  # def src=(val)
    # if !val.is_a?(String) && valid?
      # image_will_change!
      # super
    # end
  # end
end
