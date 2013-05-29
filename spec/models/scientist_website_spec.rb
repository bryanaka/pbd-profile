require 'spec_helper'

describe ScientistWebsite do
  context "when it has valid attributes" do
  	
  	it "has a valid factory" do
  		Fabricate(:scientist_website).should be_valid
  	end

  end

  context "when it has invalid atributes" do
  	it "is invalid without url" do
  		Fabricate.build(:scientist_website, :url => nil).should_not be_valid
  	end
  	
  	it "is invalid without name" do
  		Fabricate.build(:scientist_website, :name => nil).should_not be_valid
  	end

  	it "is invalid without a Scientist relation" do 
  		Fabricate.build(:scientist_website, :scientist => nil).should be_valid
  	end
  	
  	it "is invalid if desciption is more than 250 charecters" do
  		Fabricate.build(:scientist_website, :description => ("yo dawg"*100) ).should_not be_valid
  	end

  end

end
