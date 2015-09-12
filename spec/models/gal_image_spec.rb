require 'rails_helper'

RSpec.describe GalImage, type: :model do
  let(:gal_image){ build :gal_image }
  
  describe 'Validations' do
    it{ should validate_presence_of :src }
  end
  
  describe 'Associations' do
    it{ should belong_to :gal }
  end
  
  describe 'Idioms' do
    
    it 'should use FarmSlugs' do 
      gal_image.save!
      gal_image.slug.should == gal_image.caption.parameterize      
    end
    
    it 'should use :caption for FarmSlugs' do 
      gal_image.caption = 'A New Caption' 
      gal_image.save!
      gal_image.slug.should == 'a-new-caption'
    end
    
    it 'should save caption as id if no caption is provided. This has obvious implications for farm_slugs' do
      gal_image.save!
      gal_image.caption.should == 'image'
      gal_image.slug.should == 'image'
    end
    
    it 'should save as a typical FarmSlug, if more than one blank captions are saved' do
      gal_image.save!
      g = create(:gal_image)
      g.save!
      g.caption.should == 'image'
      g.slug.should == "image_#{g.id}"
    end    
  end
end




     