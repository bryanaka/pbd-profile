require 'spec_helper'
require 'pp'
class MockRequest < Struct.new(:env)
end

describe ShibbolethData  do

	before :each do
		# confirmed user
		Fabricate(:user, eppn: "bmrobles@lbl.gov", email: "bmrobles@lbl.gov", name: "Bryan Robles", confirmed: true)
		request = MockRequest.new( { "HTTP_EPPN" => "bmrobles@lbl.gov", "HTTP_MAIL" => "bmrobles@lbl.gov", "HTTP_CN" => "Bryan Robles" } )
		@confirmed_data = ShibbolethData.new(request)
	end

	context "object is is valid" do

		it "with the mock request params" do
			@confirmed_data.should be_valid
		end

	end


	describe "Initializing an ShibbolethData object" do

		before :each do
			messy_request = MockRequest.new( { "HTTP_EPPN" => "bmroBLes@lBl.Gov", "HTTP_MAIL" => "bmroblEs@lBl.gov", "HTTP_CN" => "BrYan RoBles" } )
			@messy_data = ShibbolethData.new(messy_request)
		end

		xit "takes three variables as an alternative attributes" do

		end

		it "downcases all attributes" do
			@messy_data.eppn.should === "bmrobles@lbl.gov"
			@messy_data.email.should === "bmrobles@lbl.gov"
		end
		
		it "capitalizes name attribute" do
			@messy_data.name.should === "Bryan Robles"
		end

		it "should find a user if it exists and return true" do
			@confirmed_data.user.should eq( User.find_by_eppn(@confirmed_data.eppn) )
		end

	end

	describe "can check the state of the current user." do
		
		before :each do
			# scientist user
			scientist = Fabricate :scientist do
				profile
			end
			scientist.save!
			scientist_user = Fabricate(:user, scientist_id: scientist.id)
			scientist_request = MockRequest.new( { "HTTP_EPPN" => scientist_user.eppn , "HTTP_MAIL" => scientist_user.email, "HTTP_CN" => scientist_user.name } )
			@scientist_data = ShibbolethData.new(scientist_request)

			# pending user
			#pending_user = Fabricate(:user)
			#pending_request MockRequest.new( { "HTTP_EPPN" => pending_user.eppn , "HTTP_MAIL" => pending_user.email, "HTTP_CN" => pending_user.name } )
			#@pending_data = ShibbolethData.new(pending_request)

			# unconfirmed user
			unconfirmed_request = MockRequest.new( { "HTTP_EPPN" => "yodawg@lbl.gov", "HTTP_MAIL" => "yodawg@lbl.gov", "HTTP_CN" => "Yo Dawg" } )
			@unconfirmed_data = ShibbolethData.new(unconfirmed_request)
		end

		context "When the user is confirmed" do
			it "should find the user and #has_user should return true" do
				@confirmed_data.has_user?.should be_true
			end
			it "#confirmed? should return true" do
				@confirmed_data.confirmed?.should be_true
			end

		end

		context "When the user is a scientist" do
			
			it "#has_user? should return true" do
				@scientist_data.has_user?.should be_true	
			end
			
			it "#confirmed? should return true" do
				@scientist_data.confirmed?.should be_true
			end
			
			it "#is_scientist? :scientist should return true" do
				@scientist_data.is_scientist?.should be_true
			end

		end
		
		context "When user is registered but is unconfirmed (pending confirmation) " do
			
			it "it finds the user" do 
				@confirmed_data.user.should_not be_nil
			end

			it "#confirmed? returns false" do
				@unconfirmed_data.confirmed?.should be_false
			end

		end

		context "When the user is unconfirmed" do
			
			it "returns nil when accessing user" do
				@unconfirmed_data.user.should be_nil
			end
			
			it "returns false with #has_user" do
				@unconfirmed_data.has_user?.should be_false
			end

		end

	end

end