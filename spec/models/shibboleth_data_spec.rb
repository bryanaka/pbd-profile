require 'spec_helper'
require 'pp'
class MockRequest < Struct.new(:env)
end

describe ShibbolethData  do
	before :all do
		
		#@scientist = Fabricate(:user)
		#@unconfirmed_user = Fabricate(:user)
	end

	before :each do
		Fabricate(:user, eppn: "bmrobles@lbl.gov", email: "bmrobles@lbl.gov", name: "Bryan Robles", confirmed: true)
		request = MockRequest.new( { "HTTP_EPPN" => "bmrobles@lbl.gov", "HTTP_MAIL" => "bmrobles@lbl.gov", "HTTP_CN" => "Bryan Robles" } )
		@data = ShibbolethData.new(request)
	end

	context "object is is valid" do

		it "with the mock request params" do
			@data.should be_valid
		end

	end


	describe "initializing an object" do

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
			@data.user.should eq( User.find_by_eppn(@data.eppn) )
		end

	end

	describe "can check the state of the current user" do
		
		before :each do
			# scientist user
			scientist_request = MockRequest.new( { "HTTP_EPPN" => "yodawg@lbl.gov", "HTTP_MAIL" => "yodawg@lbl.gov", "HTTP_CN" => "Yo Dawg" } )
			@scientist_data = ShibbolethData.new(scientist_request)
			# unconfirmed user
			unconfirmed_request = MockRequest.new( { "HTTP_EPPN" => "yodawg@lbl.gov", "HTTP_MAIL" => "yodawg@lbl.gov", "HTTP_CN" => "Yo Dawg" } )
			@unconfirmed_data = ShibbolethData.new(unconfirmed_request)
		end

		context "and the user is confirmed" do
			it "should find the user and #has_user should return true" do
				pp @data
				@data.has_user?.should be_true
			end
		end

		context "and the user is a scientist" do
			it ""
		end
		
		context "and is registered but is unconfirmed" do
			
			it "it finds the user" do 
				@data.user.should_not be_nil
			end

			it "it returns false when it is not confirmed" do
				@data.user.confirmed?.should be_false
			end

		end

		context "and there is no user" do
			
			it "returns nil when accessing user" do
				@unconfirmed_data.user.should be_nil
			end
			
			it "returns false with #has_user" do
				@unconfirmed_data.has_user?.should be_false
			end

		end

	end

end