class SessionsController < ApplicationController

  def create
    
    http_eppn = request.env["HTTP_EPPN"]
    http_eppn.nil? ? http_eppn : http_eppn.downcase!

    @user = User.find_by_eppn( http_eppn )
    
    # if not registered
    if @user.nil?
      @user = User.new
      @user.consume_shibboleth_data!(request).save!
    end

    @user.register_scientist!

    if @user.is_scientist?
      session[:user_eppn] = @user.eppn
      redirect_to scientists_url(:protocol => 'https'), :notice => "You have been sucessfully logged in"
      return
    end
    
    if @user.confirmed?
      session[:user_eppn] = @user.eppn
      redirect_to home_url(:protocol => 'https'), :notice => "You have been sucessfully logged in"
      return
    else
      redirect_to unconfirmed_url(:protocol => 'https'), :notice => "You have been placed in the waiting list to be confirmed. If you are not confirmed in 5 business days, please contact pbdwebmaster@lbl.gov"
      return
    end
    

  end

  def destroy
    session[:user_eppn] = nil
    redirect_to home_url(:protocol => 'https'), :notice => "You have been logged out of PBD Portal"
  end

  def is_scientist?(user)
    scientist = ScientistProfile.find_by_email(@http_mail)
    if scientist && !user
      shibuser = User.new(params)
      shibuser.confirmed = true
      shibuser.add_role :scientist
      shibuser.scientist_id = scientist.scientist_id
      shibuser.save
    elsif !scientist && user

    else
      return false
    end
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
