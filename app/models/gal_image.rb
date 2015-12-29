class GalImage < ActiveRecord::Base
  belongs_to :gal 
  default_scope { order(:order) }
  
  
end
