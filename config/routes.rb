Rails.application.routes.draw do
  # resources :gals
  # resources :gal_images
  
  get 'add_gal_image_form', to: 'gal_images#add_form'
end
