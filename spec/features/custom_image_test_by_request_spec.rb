require 'rails_helper'

describe 'Custom Image Test', type: :feature, js: true do
  let!(:img){ create :gal_image }
  
  #Relies on a monkey patch of FarmGalsUploader in an initialize. In this case:
  # version :test_image do
  #   process :resize_to_fill => [50, 50]
  # end 
  
  it 'should allow initializers to set new versions of uploaded images' do
      visit "/gals/#{img.gal.to_param}"
      page.evaluate_script("$('.test_image')[0].clientHeight").should == 50
  end
end
