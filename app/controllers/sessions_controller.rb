class SessionsController < ApplicationController

  def create
    # Get Shibboleth Data, then digest it.
    # finally, find the user based on shib data
    scientist = ScientistProfile.find_by_email(request.env["HTTP_EPPN"])

    if scientist
      @shibuser = User.new(request.env["HTTP_EPPN"])
    end
    @shibuser = User.new(User.find_by_eppn(request.env["HTTP_EPPN"]) || NullUser.new

    # Handle the different states of a user account:
    # Exists and confirmed,
    # Exists and not confirmed,
    # or doesn't exist

    # User newly created
    if user.new?
      @shibuser = User.new(request.env)
      set_role(user)
      redirect_to root_path, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
    else
      if user.confirmed
        sessions[:user_eppn] = @shibuser.eppn
        redirect_to root_path, :notice => "You have been sucessfully logged in"
      else
        redirect_to root_path, :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
      end
    end



    # if user.confirmed?
    #   sessions[:user_eppn] = user.eppn
    #   redirect_to root_path, :notice => "You have been successfully logged in"
    # else
    #   # User is unconfirmed
    #   redirect_to root_path, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"

    # if user && user.confirmed == true
    #   session[:user_eppn] = user.eppn
    #   redirect_to root_path, :notice => "You have been sucessfully logged in"
    # elsif user && user.confirmed == false
    #   redirect_to root_path, :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
    # else
    #   user = @shibuser
    #   set_role(user)
    #   if user.confirmed == nil
    #     user.confirmed = false
    #     user.save!
    #   end
    #   redirect_to root_path, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
    # end
  end

  def destroy
    session[:user_eppn] = nil
    redirect_to root_path, :notice => "You have been logged out of PBD Portal"
  end

  private

  # def digest_shib_data(user)
  #   user.name   = request.env["HTTP_CN"]
  #   user.email  = request.env["HTTP_MAIL"]
  #   user.eppn   = request.env["HTTP_EPPN"]
  #   raise Exception.new("Shibboleth Data Was not processed correctly") unless user.eppn
  #   user
  # end

  def set_role(user)
    profile = ScientistProfile.find_by_email(user.email)
    if profile && profile.scientist
      user.confirmed = true
      user.scientist_id = profile.scientist_id
      user.add_role "scientist"
      user.save!
    end
  end




end
