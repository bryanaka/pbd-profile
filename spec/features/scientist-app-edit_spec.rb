require 'spec_helper'

feature "Scientists Backbone App#edit - scientist edit profile view" do

	context "when logged in as a scientist" do
		
		scenario "user goes to the grid view" do
			pending
			# user should see only their own scientist page
		end

		scenario "user tries to edit profile" do
			pending
			# should see edit button
			# should be able to click edit button
			# list should disappear
			# profile edit view should show up
		end

		scenario "user edits content and saves" do
			pending
			# user should edit all fields in scientist model
			# user should save
			# check for save successfully
			# user should exit
			# user should go back into edit mode
			# check if all data was persisted
		end

		scenario "user edits content and doesn't save" do
			pending
			# user should edit all fields in scientist model
			# user should exit
			# user should go back to edit mode
			# data should not be persisted
			# data should be same as prior to edit
		end

		scenario "user tries to edit a profile that is not their own" do
			pending
			# user forces to edit path via url
			# should get redirected to list view
			# list view should have no scientists
		end
	
	end

	context "when logged in as an admin" do

	end

	context "when logged in as a superadmin" do

	end

	context "when logged in as an unconfirmed user" do
		
		scenario "user goes to the grid view" do
			pending
			# user should not see any scientists
		end

		scenario "user tries to edit a scientist" do
			pending
			# user forces to edit path via url
			# should get redirected to list view
			# list view should have no scientists
		end
					
	end
	
end
