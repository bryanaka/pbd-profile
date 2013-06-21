require 'spec_helper'

describe Scientist do

  # let!(:required_attributes) { [:first_name, :last_name, :title] }


  context "if attributes are valid" do    
    
    it "has a valid factory" do
      scientist = Fabricate(:scientist)
      scientist.should be_valid
    end

  end
  
  context "is invalid if attributes are do not match specific criteria" do
  	# I can't seem to get carrierwave to test correctly...
    required_attributes = [:first_name, :last_name, :title]
    
    required_attributes.each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    
    it { should validate_uniqueness_of(:slug) }

  	it "should create slug before save" do
  		scientist = Fabricate.build(:scientist, :slug => nil)
  		scientist.save!
  		scientist.slug.should_not be_nil
  	end

	end
	
  describe "Scientist model's relations: " do
    
    context "Check if it can build and find relations" do
      it "can build a profile"
      it "can build a title"
      it "can build a website"
    end

    context "limits of how many can exist per Scientist Model" do
      it "only allows a maximum of 5 titles"
      it "only allows a maximum of 4 websites"
    end

    context "shortcut and convience methods involving relations" do
      it "uses title.order = 1 as primary title"
    end

  end
end
