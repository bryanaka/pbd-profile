require 'spec_helper'

describe ScientistProfile do
  let(:valid_scientist) { Fabricate(:scientist) }
  let(:full_scientist) do
    sci = Fabricate(:scientist) do
      profile { Fabricate(:profile) }
    end
    sci
  end

  describe "is protected against malicious data entry" do

    # should test every attribute?
    it "should strip any html out of the varchar attributes" do
      profile = Fabricate(:profile, email: "<h2>yodawg@example.com</h2>")
      profile.save!
      find_profile = ScientistProfile.find(profile.id)
      find_profile.email.should eq("yodawg@example.com")
    end
    # should test every sttribute?
    it "should not allow XSS Attacks" do
      profile = Fabricate(:profile, city: "<script>alert('yodawg, yo hacked!')</script>")
      profile.save!
      find_profile = ScientistProfile.find(profile.id)
      find_profile.city.should eq("alert('yodawg, yo hacked!')")
    end

    # these tests violate DRY...
    it "should allow safe tags in the emphasis text" do
      full_scientist.profile.emphasis = "<h2>yo dawg, this is awesome</h2>"
      full_scientist.save!
      full_scientist.profile.emphasis.should eq("<h2>yo dawg, this is awesome</h2>")

      full_scientist.profile.emphasis += "<script>alert('yodawg, yo hacked!')</script>"
      full_scientist.save!
      full_scientist.profile.emphasis.should eq("<h2>yo dawg, this is awesome</h2>alert('yodawg, yo hacked!')")
    end

    it "should allow safe tags in the summary text" do
      full_scientist.profile.summary = "<h2>yo dawg, this is awesome</h2>"
      full_scientist.save!
      full_scientist.profile.summary.should eq("<h2>yo dawg, this is awesome</h2>")

      full_scientist.profile.summary += "<script>alert('yodawg, yo hacked!')</script>"
      full_scientist.save!
      full_scientist.profile.summary.should eq("<h2>yo dawg, this is awesome</h2>alert('yodawg, yo hacked!')")
    end

  end


  context "with valid attributes" do
  	
  	it "has a valid factory" do
      valid_scientist.should be_valid
  	end

  	it "creates a profile with the scientist as well" do
  		full_scientist.profile.should_not be_nil
  		full_scientist.profile.should be_valid
  	end

  end

  context "with invalid attributes" do

  	it "is invalid without phone1" do
  		Fabricate.build(:profile, :phone1 => nil).should_not be_valid 		
  	end

  	xit "is invalid if phone2 is set but phone2_type is not" do
  		profile = Fabricate(:profile, :phone2_type => nil)
  		expect { profile.phone2 }.to be_nil
  	end

  	xit "is invalid if phone2_type is set but phone2 is not" do
  		profile = Fabricate(:profile, :phone2 => nil)
  		expect { profile.phone2_type }.to be_nil
  	end

  	#it "is invalid if phone2_type is not cell, fax, secondary, or other"
  	
  	it "is invalid without an email" do
  		Fabricate.build(:profile, :email => nil).should_not be_valid
  	end

  	it "is invalid if it has a duplicate email" do
			Fabricate(:profile, :email => "yodawg@example.com")
			profile1 = Fabricate.build(:profile, :email => "yodawg@example.com")
			profile1.should_not be_valid
			expect { profile1.save! }.to raise_error
  	end
  	
  	it "is invalid without an address1" do
  		Fabricate.build(:profile, :address1 => nil).should_not be_valid
  	end

  	it "is invalid without a city" do
  		Fabricate.build(:profile, :city => nil).should_not be_valid
  	end

  	it "is invalid without a state" do
  		Fabricate.build(:profile, :state => nil).should_not be_valid
  	end

  	it "is invalid without a zip code" do
  		Fabricate.build(:profile, :zip_code => nil).should_not be_valid
  	end

  	it "is invalid without a emphasis" do
  		Fabricate.build(:profile, :emphasis => nil).should_not be_valid
  	end

  	xit "is invalid without a related scientist" do
  		Fabricate.build(:profile, :scientist => nil).should_not be_valid
  	end

  	it "should have a unique scientist_id" do
  		profile1 = Fabricate(:profile)
  		profile1.scientist_id = 5
      profile1.save!
  		profile2 = Fabricate.build(:profile)
  		profile2.scientist_id = 5
  		profile2.should_not be_valid
  		expect { profile2.save! }.to raise_error
  	end

  end

end
