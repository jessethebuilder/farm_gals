module FarmGalsHelper
  def farm_gal_form(remote: false)
    render partial: 'gals/form', locals: {:remote => remote}
  end
  
  def embedded_farm_gal_form(form_builder, remote: false)
    render partial: 'gals/embedded_form', locals: {:f => form_builder, :remote => remote}
  end
end