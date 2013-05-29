require 'spec_helper'

describe ScientistWebsite do
  context "when it has valid attributes" do
  	
  	it "has a valid factory" do
  		Fabricate(:scientist_website).should be_valid
  	end

    it "should have a valid scientist" do
      Fabricate(:scientist_website).scientist.should be_valid
    end

  end

  # all these are tainted by a failing scientist 
  context "when it has invalid atributes" do
  	it "is invalid without url" do
  		Fabricate.build(:scientist_website, :url => nil).should be_valid
  	end
  	
  	it "is invalid without name" do
  		Fabricate.build(:scientist_website, :name => nil).should_not be_valid
  	end

  	it "is invalid without a Scientist relation" do 
  		Fabricate.build(:scientist_website, :scientist => nil).should_not be_valid
  	end
  	
  	it "is invalid if desciption is more than 250 charecters" do
  		Fabricate.build(:scientist_website, :description => ("yo dawg"*100) ).should_not be_valid
  	end

    it "is invalid if order is not a number" do
      Fabricate.build(:scientist_website, :order => "yo dawg" ).should_not be_valid
    end
    
    it "is invalid if order is greater than 4 and less than 1" do
      Fabricate.build(:scientist_website, :order => 100 ).should_not be_valid
    end

  end

end
