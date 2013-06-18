require 'spec_helper'

# class ShibbolethDataRequestTest < ActionController::TestCase
# 	tests SessionsController
# end

class MockRequest < Struct.new(:eppn, :email, :name)

	def initialize(params) 
		@eppn = params["HTTP_EPPN"]
		@email = params["HTTP_MAIL"]
		@name = params["HTTP_CN"]
	end

	def env
		{"HTTP_EPPN" => @eppn, "HTTP_MAIL" => @email, "HTTP_CN" => @name}
	end

end

describe "logging in", :type => :feature do
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
		request = MockRequest.new(env)
		request
	end

	context "When the user is confirmed" do

		before :each do
			inject_shibboleth_user_data!(confirmed_user)
		end
		
		it "signs me in normally" do
			visit root_url
			page.should have_content 'You have been sucessfully logged in'
		end

	end

	context "The user is a scientst"

	context "The user is pending confirmation"

	context "The user is unconfirmed"

end