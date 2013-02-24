require "spec_helper"

describe ScientistsController do
  describe "routing" do

    it "routes to #index" do
      get("/scientists").should route_to("scientists#index")
    end

    it "routes to #new" do
      get("/scientists/new").should route_to("scientists#new")
    end

    it "routes to #show" do
      get("/scientists/1").should route_to("scientists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scientists/1/edit").should route_to("scientists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scientists").should route_to("scientists#create")
    end

    it "routes to #update" do
      put("/scientists/1").should route_to("scientists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scientists/1").should route_to("scientists#destroy", :id => "1")
    end

  end
end
