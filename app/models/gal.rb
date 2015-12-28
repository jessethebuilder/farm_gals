class Gal < ActiveRecord::Base
  belongs_to :has_farm_gals, polymorphic: true
  
  has_many :gal_images
  accepts_nested_attributes_for :gal_images, :reject_if => :reject_gal_image, :allow_destroy => true
  
  serialize :image_order, Array
  
  def reject_gal_image(attrs)
    attrs['id'].blank? && attrs['src'].blank?
  end
  
  def images(version = nil)
    gal_images.map{ |i| i.src.url(version) }
  end
  
  def bulk_upload=(arr)
    arr.each do |i|
      self.gal_images << GalImage.new(:src => i)
    end
  end
end
