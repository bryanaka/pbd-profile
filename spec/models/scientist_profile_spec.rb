require 'spec_helper'

describe ScientistProfile do

  context "with valid attributes" do
  	
  	it "has a valid factory" do
  		Fabricate(:scientist_profile).should be_valid
  	end

  	it "creates a scientist with the profile as well" do
  		profile = Fabricate(:scientist_profile)
  		profile.scientist.should_not be_nil
  		profile.scientist.should be_valid
  	end

  end

  context "with invalid attributes" do

  	it "is invalid without phone1" do
  		Fabricate.build(:scientist_profile, :phone1 => nil).should_not be_valid 		
  	end

  	xit "is invalid if phone2 is set but phone2_type is not" do
  		profile = Fabricate(:scientist_profile, :phone2_type => nil)
  		expect { profile.phone2 }.to be_nil
  	end

  	xit "is invalid if phone2_type is set but phone2 is not" do
  		profile = Fabricate(:scientist_profile, :phone2 => nil)
  		expect { profile.phone2_type }.to be_nil
  	end

  	it "is invalid if phone2_type is not cell, fax, secondary, or other"
  	
  	it "is invalid without an email" do
  		Fabricate.build(:scientist_profile, :email => nil).should_not be_valid
  	end

  	it "is invalid if it has a duplicate email" do
			Fabricate(:scientist_profile, :email => "yodawg@example.com")
			profile1 = Fabricate.build(:scientist_profile, :email => "yodawg@example.com")
			profile1.should_not be_valid
			expect { profile1.save! }.to raise_error
  	end
  	
  	it "is invalid without an address1" do
  		Fabricate.build(:scientist_profile, :address1 => nil).should_not be_valid
  	end

  	it "is invalid without a city" do
  		Fabricate.build(:scientist_profile, :city => nil).should_not be_valid
  	end

  	it "is invalid without a state" do
  		Fabricate.build(:scientist_profile, :state => nil).should_not be_valid
  	end

  	it "is invalid without a zip code" do
  		Fabricate.build(:scientist_profile, :zip_code => nil).should_not be_valid
  	end

  	it "is invalid without a emphasis" do
  		Fabricate.build(:scientist_profile, :emphasis => nil).should_not be_valid
  	end

  	it "is invalid without a related scientist" do
  		Fabricate.build(:scientist_profile, :scientist => nil).should_not be_valid
  	end

  	it "should have a unique scientist_id" do
  		profile1 = Fabricate(:scientist_profile)
  		profile1.scientist_id = 5
  		profile2 = Fabricate.build(:scientist_profile)
  		profile2.scientist_id = 5
  		profile2.should_not be_valid
  		expect { profile2.save! }.to raise_error
  	end

  	xit "should have "

  end

end
