class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
  
  end

  def permitted_params
  	@permitted_params ||= PermittedParams.new(params, current_user)
  end

end
