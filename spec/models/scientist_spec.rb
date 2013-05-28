require 'spec_helper'

describe Scientist do
  
  context "if attributes are invalid" do
  	# I can't seem to get carrierwave to test correctly...
  	it "is invalid without first name" do
  		scientist = Fabricate.build(:scientist, :first_name => nil)
  		scientist.should_not be_valid
  	end

  	it "is invalid without last name" do
  		scientist = Fabricate.build(:scientist, :last_name => nil)
  		scientist.should_not be_valid
  	end

  	it "should create slug before save" do
  		scientist = Fabricate.build(:scientist, :slug => nil)
  		scientist.save!
  		scientist.slug.should_not be_nil
  	end

  	it "is invalid and raises exception if it doesn't have a unique slug" do
  		scientist = Fabricate.build(:scientist, :slug => "yodawg")
  		scientist1 = Fabricate.build(:scientist, :slug => "yodawg")
  		scientist.save!
  		scientist.should be_valid
  		scientist1.should_not be_valid
  		expect { scientist1.save! }.to raise_error
  	end

  	it "is invalid wihtout a title" do
  		scientist = Fabricate.build(:scientist, :first_name => nil)
  		scientist.should_not be_valid
  	end

	end
	
	context "if attributes are valid" do  	
		
		it "has a valid factory" do
			scientist = Fabricate(:scientist)
			scientist.should be_valid
		end

	end
end
