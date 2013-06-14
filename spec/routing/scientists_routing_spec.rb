require "spec_helper"

describe ScientistsController do
  describe "routing" do

    it "routes to #index" do
      get("/pbdportal/scientists").should route_to("scientists#index")
    end

    it "routes to #new" do
      pending
      get("/pbdportal/scientists/new").should route_to("scientists#index")
    end

    it "routes to #show" do
      get("/pbdportal/scientists/1").should route_to("scientists#index", :id => "1")
    end

    it "routes to #edit" do
      get("/pbdportal/scientists/1/edit").should route_to("scientists#index", :id => "1")
    end

    it "routes to #update" do
      put("/pbdportal/scientists/1").should route_to("scientists#index", :id => "1")
    end

  end
end
