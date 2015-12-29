module FarmGalsHelper
  def farm_gal_embedded_bootstrap_form(form_builder, preview_version: :thumb, show_bulk_uploader: true)
     render :partial => 'gals/bootstrap_form', 
            :locals => {:f => form_builder, :preview_version => preview_version, :show_bulk_uploader => show_bulk_uploader}
  end
  
  def farm_gal_bootstrap_carousel(gal, carousel_id: 'farm_gal_carousel', image_version: :slide, show_indicators: true)
    render :partial => 'gals/bootstrap_carousel',
           :locals => {:gal => gal, :carousel_id => carousel_id, :image_version => image_version, :show_indicators => show_indicators}  
  end  
end