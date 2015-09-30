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
 
end
