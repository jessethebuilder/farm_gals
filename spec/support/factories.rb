FactoryGirl.define do
  factory :gal do
    name { Faker::Name.name }
  end
  
  factory :gal_image do 
    factory :gal_image_with_src do
      src Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/test.png'))) 
    end
    # src Rack::Test::UploadedFile.new(File.open('../support/test.png')) 
  end
end