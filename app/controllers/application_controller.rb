class ApplicationController < ActionController::Base

  before_filter :check_session
  load_and_authorize_resource
  skip_authorize_resource :only => :check_session

  protect_fom_forgery

  def check_session
    if !session[:user]
      redirect_to :controller => 'saml', :action => 'init'
    end
  end

  private

  def current_user
  end

  def permitted_params
  	@permitted_params ||= PermittedParams.new(params, current_user)
  end



end
