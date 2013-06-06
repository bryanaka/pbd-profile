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

    it "renders JSON to the client" do
      3.times do
        Fabricate(:scientist)
      end
      @scientist = Scientist.find(2)
      get :index, {}, valid_session
      response.body.should include(@scientist.first_name)
    end
    
  end

  describe "GET show" do
    it "assigns the requested scientist as @scientist" do
      scientist = Scientist.create! valid_attributes
      get :show, {:id => scientist.to_param}, valid_session
      assigns(:scientist).should eq(scientist)
    end
  end

  describe "GET new" do
    it "assigns a new scientist as @scientist" do
      get :new, {}, valid_session
      assigns(:scientist).should be_a_new(Scientist)
    end
  end

  describe "GET edit" do
    it "assigns the requested scientist as @scientist" do
      scientist = Scientist.create! valid_attributes
      get :edit, {:id => scientist.to_param}, valid_session
      assigns(:scientist).should eq(scientist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scientist" do
        expect {
          post :create, {:scientist => valid_attributes}, valid_session
        }.to change(Scientist, :count).by(1)
      end

      it "assigns a newly created scientist as @scientist" do
        post :create, {:scientist => valid_attributes}, valid_session
        assigns(:scientist).should be_a(Scientist)
        assigns(:scientist).should be_persisted
      end

      it "redirects to the created scientist" do
        post :create, {:scientist => valid_attributes}, valid_session
        response.should redirect_to(Scientist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scientist as @scientist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        post :create, {:scientist => {  }}, valid_session
        assigns(:scientist).should be_a_new(Scientist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        post :create, {:scientist => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested scientist" do
        scientist = Scientist.create! valid_attributes
        # Assuming there are no other scientists in the database, this
        # specifies that the Scientist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Scientist.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => scientist.to_param, :scientist => { "these" => "params" }}, valid_session
      end

      it "assigns the requested scientist as @scientist" do
        scientist = Scientist.create! valid_attributes
        put :update, {:id => scientist.to_param, :scientist => valid_attributes}, valid_session
        assigns(:scientist).should eq(scientist)
      end

      it "redirects to the scientist" do
        scientist = Scientist.create! valid_attributes
        put :update, {:id => scientist.to_param, :scientist => valid_attributes}, valid_session
        response.should redirect_to(scientist)
      end
    end

    describe "with invalid params" do
      it "assigns the scientist as @scientist" do
        scientist = Scientist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        put :update, {:id => scientist.to_param, :scientist => {  }}, valid_session
        assigns(:scientist).should eq(scientist)
      end

      it "re-renders the 'edit' template" do
        scientist = Scientist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Scientist.any_instance.stub(:save).and_return(false)
        put :update, {:id => scientist.to_param, :scientist => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested scientist" do
      scientist = Scientist.create! valid_attributes
      expect {
        delete :destroy, {:id => scientist.to_param}, valid_session
      }.to change(Scientist, :count).by(-1)
    end

    it "redirects to the scientists list" do
      scientist = Scientist.create! valid_attributes
      delete :destroy, {:id => scientist.to_param}, valid_session
      response.should redirect_to(scientists_url)
    end
  end

end
