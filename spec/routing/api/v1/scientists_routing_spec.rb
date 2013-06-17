require "spec_helper"

describe Api::V1::ScientistsController do

	describe "routing" do
		
		it "gets #index" do
			get("/pbdportal/api/v1/scientists").should route_to(api_v1_scientists_path, :format => "json")
		end

		it "puts #update" do
			put("/pbdportal/api/v1/scientists").should route_to()
		end

		it "gets #show" do
			get("/pbdportal/api/v1/scientists/1").should route_to()
		end

		it "post #create" do
			post("/pbdportal/api/v1/scientists").should route_to()
		end

	end

end