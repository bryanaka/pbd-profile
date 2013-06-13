require 'spec_helper'

describe "the login in process", :type => :feature do
	context "The user is confirmed" do
		it "signs me in" do
			visit root_url
			page.should have_content 'You have been sucessfully logged in'
		end
	end
	context "The user is a scientst"
	context "The user is pending confirmation"
	context "The user is unconfirmed"
end