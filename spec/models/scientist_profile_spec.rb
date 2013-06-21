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

  xit "trims the additional whitespace on save" do
    full_scientist.attributes.each_pair do |key, value|
      fu
    end
    full_scientist.profile.city = "berkeley         "
    full_scientist.save!
    full_scientist.profile.city.should eq("berkeley")

    full_scientist.profile.state = "CA\t\t\t\t\t\t\t\t"
    full_scientist.save!
    full_scientist.profile.state.should eq("CA")
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

    required_attributes = [:phone1, :email, :address1, :city, :state, :zip_code, :emphasis]

    required_attributes.each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:scientist_id) }

    xit "should convert numbers into a consistant format" do
      # take in a number
      # strip away everything but the numbers
      # use number_to_phone to change it to correct format
    end

  	xit "is invalid if phone2 is set but phone2_type is not" do
  		profile = Fabricate(:profile, :phone2_type => nil)
  		expect { profile.phone2 }.to be_nil
  	end

  	xit "is invalid if phone2_type is set but phone2 is not" do
  		profile = Fabricate(:profile, :phone2 => nil)
  		expect { profile.phone2_type }.to be_nil
  	end


  	xit "is invalid without a related scientist" do
  		Fabricate.build(:profile, :scientist => nil).should_not be_valid
  	end

  end

end
