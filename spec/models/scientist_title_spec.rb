require 'spec_helper'

describe ScientistTitle do
  context "with valid attributes should validate: " do

  	it "has valid factory" do
  		Fabricate(:scientist_title).should be_valid
  	end

  end
  
  context "with invalid attributes should fail: " do

  	it "Name is nil should fail" do
  		Fabricate.build(:scientist_title, :title => nil).should_not be_valid
  	end

  	it "order is nil should fail" do
  		Fabricate.build(:scientist_title, :order => nil).should_not be_valid
  	end

  	it "order should be number less than or equal to 5" do
  		Fabricate.build(:scientist_title, :order => 600).should_not be_valid
  	end

  	it "order can't be a string" do
  		Fabricate.build(:scientist_title, :order => "yodawg").should_not be_valid
  	end



  end

end
