require 'spec_helper'

describe Api::V1::ScientistsController do

  # This should return the minimal set of attributes required to create a valid
  # Scientist. As you add validations to Scientist, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScientistsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do

    it "assigns all scientists as @scientists" do
      scientist = Fabricate(:scientist)
      get :index, {}, valid_session
      assigns(:scientists).should eq([scientist])
    end

    it "renders JSON to the client as a collection" do
      # this test needs to be refactored to test for actual json vs one attribute
      3.times do
        Fabricate(:scientist)
      end
      @scientist1 = Scientist.find(1)
      @scientist2 = Scientist.find(2)
      @scientist3 = Scientist.find(3)
      get :index, {}, valid_session
      response.body.should include(@scientist1.first_name)
      response.body.should include(@scientist2.last_name)
      response.body.should include(@scientist3.slug)
    end

    context "should only render what is needed" do

      it "does not render any profile attributes"
      it "does not render any website attributes"
      it "should only render the first title"

    end
    
  end

  describe "GET show" do
    before :each do
      3.times do
        Fabricate(:scientist)
      end
      @scientist = Scientist.find( rand(1..3) )
      @scientist1 = Scientist.find(1)
      @scientist2 = Scientist.find(2)
      @scientist3 = Scientist.find(3)
    end

    it "assigns the requested scientist as @scientist" do
      get :show, {:id => @scientist1.to_param}, valid_session
      assigns(:scientist).should eq(@scientist1)
    end

    it "renders scientist JSON to the client" do
      # this test needs to be refactored to test for actual json vs one attribute
      get :show, { :id => @scientist.to_param }, valid_session
      response.body.should include(@scientist.last_name)
    end

    it "renders the profile JSON in the response" do
      get :show, { :id => @scientist.to_param }, valid_session
      response.body.should include(@scientist.profile.address1)
    end

    it "renders the websites JSON in the response"

    it "renders the titles JSON in the response"
  end

  describe "POST create" do
    context "with valid params" do
      xit "creates a new Scientist" do
        expect {
          post :create, {:scientist => valid_attributes}, valid_session
        }.to change(Scientist, :count).by(1)
      end

      xit "assigns a newly created scientist as @scientist" do
        post :create, {:scientist => valid_attributes}, valid_session
        assigns(:scientist).should be_a(Scientist)
        assigns(:scientist).should be_persisted
      end

      xit "redirects to the created scientist" do
        post :create, {:scientist => valid_attributes}, valid_session
        response.should redirect_to(Scientist.last)
      end
    end

    context "with invalid params" do
      xit "assigns a newly created but unsaved scientist as @scientist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        post :create, {:scientist => {  }}, valid_session
        assigns(:scientist).should be_a_new(Scientist)
      end

      xit "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        post :create, {:scientist => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested scientist" do
        scientist = Scientist.create! valid_attributes
        # Assuming there are no other scientists in the database, this
        # specifies that the Scientist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Scientist.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => scientist.to_param, :scientist => { "these" => "params" }}, valid_session
      end

      xit "assigns the requested scientist as @scientist" do
        scientist = Scientist.create! valid_attributes
        put :update, {:id => scientist.to_param, :scientist => valid_attributes}, valid_session
        assigns(:scientist).should eq(scientist)
      end

      xit "redirects to the scientist" do
        scientist = Scientist.create! valid_attributes
        put :update, {:id => scientist.to_param, :scientist => valid_attributes}, valid_session
        response.should redirect_to(scientist)
      end
    end

    describe "with invalid params" do
      xit "assigns the scientist as @scientist" do
        scientist = Scientist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        put :update, {:id => scientist.to_param, :scientist => {  }}, valid_session
        assigns(:scientist).should eq(scientist)
      end

      xit "re-renders the 'edit' template" do
        scientist = Scientist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        put :update, {:id => scientist.to_param, :scientist => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested scientist" do
      scientist = Scientist.create! valid_attributes
      expect {
        delete :destroy, {:id => scientist.to_param}, valid_session
      }.to change(Scientist, :count).by(-1)
    end

    xit "redirects to the scientists list" do
      scientist = Scientist.create! valid_attributes
      delete :destroy, {:id => scientist.to_param}, valid_session
      response.should redirect_to(scientists_url)
    end
  end

end
