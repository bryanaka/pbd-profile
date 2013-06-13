require 'spec_helper'
require 'pp'

class ShibbolethDataRequestTest < ActionController::TestCase
	tests SessionsController
end

describe SessionsController do
	let(:confirmed_user) { Fabricate(:user, confirmed: true) }

	let(:unconfirmed_user) { Fabricate(:user) }

	let(:scientist_user) do
		scientist = Fabricate(:scientist) do
			profile
		end
		user = Fabricate(:user, email: scientist.profile.email )
		user
	end

	let(:confirmed_scientist_user) do
		scientist2 = Fabricate(:scientist) do
			profile
		end
		user = Fabricate(:user, email: scientist2.profile.email, scientist_id: scientist2.id, confirmed: true )
		user
	end

	let(:new_user) { Fabricate.build(:user) }

	def inject_shibboleth_user_data!(user_type)
		env = { "HTTP_EPPN" => user_type.eppn, "HTTP_MAIL" => user_type.email, "HTTP_CN" => user_type.name }
		env.each_pair do |key, value|
			request.env[key] = value
			request
		end
	end

	describe "requests a login or Session#create" do

		context "When the user is confirmed" do
			
			before :each do
				inject_shibboleth_user_data!(confirmed_user)
			end

			it "creates a new session" do
				get :create
				session[:user_eppn].should_not be_nil
			end
			
			it "does not create a new user" do
				user_count = User.all.count
				get :create
				user_count.should eq User.all.count
			end
				
			it "redirects to the home page (home_url)" do
					get :create
					response.should redirect_to(home_url(protocol: 'https'))
			end

			context "and is a scientist" do
				
				before :each do
					inject_shibboleth_user_data!(confirmed_scientist_user)
				end

				it "it redirects to the Scientist#index" do
					get :create
					response.should redirect_to(scientists_url(protocol: 'https'))
				end

			end

		end

		context "When a user is an unconfirmed scientist" do

			before :each do
				inject_shibboleth_user_data!(scientist_user)
				get :create
			end
			
			it "creates a new user" do
				test_user = User.find_by_scientist_id(scientist_user.scientist_id)
				test_user.should_not be_nil
			end
			
			it "autoconfirms user" do
				test_user = User.find_by_scientist_id(scientist_user.scientist_id)
				test_user.should be_confirmed
			end
			
			it "creates a new session" do
				session[:user_eppn].should_not be_nil
			end
			
			it "redirects to the Scientist#index" do
				response.should redirect_to( scientists_url(protocol: 'https') )
			end

		end

		context "User is pending confirmation" do
			
			before :each do
				inject_shibboleth_user_data!(unconfirmed_user)
			end
				
			it "does not create a new session" do
				get :create
				session[:user_eppn].should be_nil
			end

			it "does not create a new user" do
				user_count = User.all.count
				get :create
				user_count.should eq User.all.count
			end

			it "resends mailer to webmaster if it has been more than 7 days" do
				pending
			end
			
			it "redirects to the Pages#unconfirmed" do
				get :create
				response.should redirect_to unconfirmed_url(protocol: 'https')
			end

		end

		context "and is not registered" do

			before :each do
				inject_shibboleth_user_data!(new_user)
			end

			it "creates a new user" do
				user_count = User.all.count
				get :create
				user_count.should_not eq User.all.count
			end
			
			it "sends mailer with user details" do
				pending
			end
			
			it "redirects to Pages#unconfirmed" do
				get :create
				response.should redirect_to unconfirmed_url(protocol: 'https')
			end
		
		end

	end

	describe "match #destroy" do
	end

end
