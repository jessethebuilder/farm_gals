require 'rails_helper'

RSpec.describe GalImage, type: :model do
  let(:gal_image){ build :gal_image_with_src }
  let(:g){ build :gal_image }
  
  describe 'Validations' do
    # it{ should validate_presence_of :src }
  end
  
  describe 'Associations' do
    it{ should belong_to :gal }
  end
  
  describe 'Idioms' do
    it 'should not save if no src is provided' do 
      g.src = nil
      g.save
      g.reload
      g.persisted?.should == false    
    end
    
    it 'should save if a proper remote url is passed' do 
      g.remote_src_url = 'http://www.anysoft.us/assets/logos/red_blue_horizontal-575ad2c85c4e15affa673af5124eee71f80ba3767b3da318871da6692f87abda.png'
      g.save
      g.reload
      g.persisted?.should == true
    end
    
    # it 'should not save if remote_url is not '
    
    it 'should use FarmSlugs' do 
      gal_image.caption = Faker::Lorem.sentence
      gal_image.save!
      gal_image.slug.should == gal_image.caption.parameterize      
    end
    
    it 'should use :caption for FarmSlugs' do 
      gal_image.caption = 'A New Caption' 
      gal_image.save!
      gal_image.slug.should == 'a-new-caption'
    end
    
    it 'should save slug as "Image_[id] if no caption is provided. Behavior from FarmSlugs' do
      gal_image.save!
      gal_image.slug.should == "gal-image_#{gal_image.id}"
    end    
  end
end




     