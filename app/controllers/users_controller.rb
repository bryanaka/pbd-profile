class UsersController < ApplicationController

  # def current_user
  #   @user = User.find_by_eppn(session[:user_eppn])
  # end

  def edit_scientists
    if can? :manage, Scientist
      render 'edit_scientists'
    else
      redirect_to login_path :notice => 'Insufficient permissions'
    end
  end

end
