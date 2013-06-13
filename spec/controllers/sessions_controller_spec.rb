require 'spec_helper'
require 'pp'
describe SessionsController do
	
	describe "match #create" do

		describe "User is confirmed" do
			
			before :each do
				@user = Fabricate(:user, confirmed: true)
			end

			it "creates a new session" do
				get :create
				pp request
				session[:user_eppn].should_not be_nil
			end
			
			it "does not create a new user"
			
			context "and is a scientist" do

				it "redirects to the Scientist#index"

			end

			context "and is not a scientist" do
				it "redirects to the Pages#index"
			end

		end

		describe "User is unconfirmed" do
			
			context "and is a scientist" do
				it "creates a new user"
				it "autoconfirms user"
				it "creates a new session"
			end
			
			context "and is pending confirmation" do
				it "does not create a new session"
				it "resends mailer to webmaster if it has been more than 7 days"
				it "redirects to the Pages#unconfirmed"
			end

			context "User is not registered" do
				it "creates a new user"
				it "sends mailer with user details"
				it "redirects to Pages#unconfirmed"
			end

		end

		
		
	end

	describe "match #destroy" do
	end

end
