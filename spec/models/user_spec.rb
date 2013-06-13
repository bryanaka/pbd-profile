require 'spec_helper'

describe User do

  it "#consume_shibboleth_data sets it's own attributes via request object" do
    class MockRequest < Struct.new(:env)
    end
    request = MockRequest.new( { "HTTP_EPPN" => "bmrobles@lbl.gov", "HTTP_MAIL" => "bmrobles@lbl.gov", "HTTP_CN" => "Bryan Robles" } )
    user = User.new
    user.consume_shibboleth_data!(request)
    user.eppn.should eq("bmrobles@lbl.gov")
    user.email.should eq("bmrobles@lbl.gov")
    user.name.should eq("Bryan Robles")
  end
  
  context "When user is confirmed" do
    
    before :each do
      @user = Fabricate(:user, confirmed: true)
    end

    it "#confirmed? returns true" do
      @user.should be_confirmed
    end

  end

  context "when user is a scientist" do

    before :each do
      scientist = Fabricate(:scientist) do
        profile
      end
      @scientist_user = Fabricate(:user, email: scientist.profile.email)
    end

    it "#is_scientist? returns true" do
      @scientist_user.is_scientist?.should be_true
    end

    it "#confirmed? returns true because it auto confirms by email" do
      @scientist_user.should be_confirmed
    end

    it "has user role of scientist because of auto confirmation" do
      @scientist_user.has_role?(:scientist).should be_true
    end

  end

  context "When user is pending confirmation or is unconfirmed" do

    before :each do
      @pending_user = Fabricate(:user)
    end

    it "#is_scientist? returns false" do
      @pending_user.is_scientist?.should be_false
    end
    
    it "#confirmed? returns false" do
      @pending_user.should_not be_confirmed
    end

  end

  context "When the attributes are valid" do

  	it "has a valid factory" do
  		Fabricate(:user).should be_valid
  	end

  	it "defaults to confirmed = false" do
  		Fabricate(:user).confirmed?.should be_false
  	end

  	it "can add roles and retrieve roles" do
  		user = Fabricate(:user)
  		user.add_role :scientist
  		user.roles.should include(Role.find_by_name(:scientist))
  		user.has_role?(:scientist).should be_true
  	end

  	xit "can add resource specific resource scoped roles"

  	it "can revoke roles" do
  		user = Fabricate(:user)
  		user.add_role :scientist
  		user.has_role?(:scientist).should be_true
  		user.revoke :scientist
  		user.has_role?(:scientist).should be_false
  	end

    it "downcases all attributes" do
      user = Fabricate(:user, eppn: "BmRobles@LbL.gOv", email: "BMROBLES@LBL.GOV")
      user.eppn.should === "bmrobles@lbl.gov"
      user.email.should === "bmrobles@lbl.gov"
    end
    
    it "capitalizes name attribute" do
      user = Fabricate(:user, name: "BrYan roBLes")
      user.name.should === "Bryan Robles"
    end

	end

  context "When the attributes are invalid" do

    it "is invalid without eppn" do
      Fabricate.build(:user, :eppn => "").should_not be_valid
    end

    it "should not have a duplicate eppn, or else raise exception" do
      user1 = Fabricate.build(:user, :eppn => "yodawg")
      user2 = Fabricate.build(:user, :eppn => "yodawg")
      user1.save!
      user1.should be_valid
      user2.should_not be_valid
      expect {user2.save!}.to raise_error
    end

    it "is invalid without name" do
      Fabricate.build(:user, :name => "").should_not be_valid
    end
    
    it "is invalid without email" do
      Fabricate.build(:user, :email => "").should_not be_valid
    end
    
    it "should not match any other user's scientist_id" do
      Fabricate(:user, :scientist_id => 5).save
      user2 = Fabricate.build(:user, :scientist_id => 5)
      user2.should_not be_valid
      expect {user2.save!}.to raise_error
    end

  end

end
