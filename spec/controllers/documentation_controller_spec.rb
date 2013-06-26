require 'spec_helper'

describe DocumentationController do
	it "GET #index" do
		documentation = Fabricate(:documentation)
		get :index
		response.should eq([documentation])
	end

end
