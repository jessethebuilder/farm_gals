require 'rails_helper'

RSpec.describe Gal, type: :model do
  let(:gal){ build :gal }
  describe 'Validations' do
    # it{ should validate_presence_of :name }    
  end
  
  describe 'Associations' do
    it{ should have_many :gal_images }
    it{ should belong_to :has_farm_gals }
  end
  
  describe 'Idioms' do
    it 'should use FarmSlugs' do
      gal.save!
      gal.slug.should == gal.name.parameterize   
    
      gal.name = 'A New Name' 
      gal.save!
      gal.slug.should == 'a-new-name'
      
      Gal.find('a-new-name').should == gal  
    end     
  end
end
