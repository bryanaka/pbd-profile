require 'spec_helper'

feature "Documentation" do
	
	scenario "User wants to read documentation" do
		visit "/pbdportal/docs"
		page.should have_content('PBD Portal Documentation')
	end

end