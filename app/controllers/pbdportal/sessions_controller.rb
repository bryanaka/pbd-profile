require 'pp'
class SessionsController < ApplicationController

  # this definitely needs to be refactored.
  def create
    # Get Shibboleth Data, then digest it.
    # finally, find the user based on shib data
    http_eppn = request.env["HTTP_EPPN"]
    http_mail = request.env["HTTP_MAIL"]
    http_cn = request.env["HTTP_CN"]
    http_eppn.downcase!
    http_mail.downcase!
    http_cn.downcase!.capitalize!
    pp http_eppn


    scientist = ScientistProfile.find_by_email(http_mail)
    shibuser = User.find_by_eppn(http_eppn)

    params = {eppn: http_eppn, email: http_mail, name: http_cn }

    # if the user is both a scientist and is not registered already
    # allow auto-confirmation and add scientist role
    if scientist && !shibuser
      shibuser = User.new(params)
      shibuser.confirmed = true
      shibuser.add_role :scientist
      shibuser.scientist_id = scientist.scientist_id
      shibuser.save
    end

    shibuser ||= NullUser.new
    # User is completely new
    if shibuser.new?
      shibuser = User.new(params)
      WebmasterMailer.confirm_user_email(shibuser).deliver
      redirect_to root_path, :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 2 business days, please contact pbdwebmaster@lbl.gov"
    else
      # if user is not new and confirmed
      if shibuser.confirmed
        session[:user_eppn] = shibuser.eppn
        redirect_to root_path, :protocol => 'https', :notice => "You have been sucessfully logged in"
      # user not new and not yet confirmed
      else
        redirect_to root_path, :protocol => 'https', :notice => "You are still on the waiting list to be confirmed. If 2 business days have passed, please contact pbdwebmaster@lbl.gov"
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
