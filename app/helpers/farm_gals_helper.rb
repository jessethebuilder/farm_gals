module FarmGalsHelper
  def farm_gal_embedded_bootstrap_form(form_builder, preview_version: :thumb, show_bulk_uploader: true)
     render :partial => 'gals/bootstrap_form', 
            :locals => {:f => form_builder, :preview_version => preview_version, :show_bulk_uploader => show_bulk_uploader}
  end
end