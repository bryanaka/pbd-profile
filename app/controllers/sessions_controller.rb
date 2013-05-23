class SessionsController < ApplicationController

  def create
    # Get Shibboleth Data, then digest it.
    # finally, find the user based on shib data
    scientist = ScientistProfile.find_by_email(request.env["HTTP_EPPN"])
    shibuser = User.find_by_eppn(request.env["HTTP_EPPN"])

    params = {eppn: request.env["HTTP_EPPN"], email: request.env["HTTP_MAIL"], name: request.env["HTTP_CN"]}

    # if the user is both a scientist and is registered already
    # allow auto-confirmation and add scientist role
    if scientist && !shibuser
      shibuser = User.new(params)
      shibuser.confirmed = true
      shibuser.add_role :scientist
      shibuser.scientist_id = scientist.scientist_id
      shibuser.save
    end

    shibuser ||= NullUser.new

    if shibuser.new?
      shibuser = User.new(params)
      WebmasterMailer.confirm_user_email(shibuser).deliver
      redirect_to root_path, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
    else
      if shibuser.confirmed
        session[:user_eppn] = shibuser.eppn
        redirect_to root_path, :notice => "You have been sucessfully logged in"
      else
        redirect_to root_path, :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
      end
    end
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

  # def set_role(user)
  #   profile = ScientistProfile.find_by_email(user.email)
  #   if profile && profile.scientist
  #     user.confirmed = true
  #     user.scientist_id = profile.scientist_id
  #     user.add_role "scientist"
  #     user.save!
  #   end
  # end

end
