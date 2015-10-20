class GalImagesController < ApplicationController
  before_action :set_gal_image 
  
  def destroy
    @gal_image.destroy
  end
  
  private
  
  def set_gal_image
    @gal_image = GalImage.find(params[:id])
  end
end