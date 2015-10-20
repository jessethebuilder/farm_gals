class ApplicationController < ActionController::Base
  def files_to_gals(obj, param)
    unless params[param].empty?
      obj.gal = Gal.new unless obj.gal
      params[param].each do |i|
        gi = GalImage.new
        gi.src = i
        obj.gal.gal_images << gi
      end
    end
  end
end