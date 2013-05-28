require 'spec_helper'

describe User do

  context "attributes are invalid" do

  	it "is invalid without eppn" do
  		Fabricate.build(:user, :eppn => nil).should_not be_valid
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
  		Fabricate.build(:user, :name => nil).should_not be_valid
  	end
  	
  	it "is invalid without email" do
  		Fabricate.build(:user, :email => nil).should_not be_valid
  	end
  	
  	it "should not match any other user's scientist_id" do
  		Fabricate(:user, :scientist_id => 5).save
  		user2 = Fabricate.build(:user, :scientist_id => 5)
  		user2.should_not be_valid
  		expect {user2.save!}.to raise_error
  	end

  	xit "confirms automatically if scientist and save scientist id"
  	xit "doesn't confirm if not scientist"
  	xit "doesn't allow user to edit attributes except name"

  end

  context "attributes are valid" do

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

	end

end
