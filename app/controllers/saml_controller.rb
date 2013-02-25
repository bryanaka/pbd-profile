class SamlController < ApplicationController

  BerkeleyFingerprint = "15:48:E2:28:E7:53:79:C0:96:32:52:FC:00:FF:28:7B:92:50:A8:97"

  def init
    request = Onelogin::Saml::Authrequest.new
    redirect_to(request.create(saml_settings))
  end

  def consume
    response = Onelogin::Saml::Response.new(params[:SAMLResponse])
    response.settings = saml_settings

    if response.is_valid? && (user = User.find_by_email(response.name_id) || Scientist.find_by_email(repsonse.name_id))
      authorize_success(user)
    else
      authorize_failure(user)
    end
    redirect_to root_path
  end

  def logout
    session.delete :user
    redirect_to root_path
  end

  def metadata
    settings = saml_settings
    meta = Onelogin::Saml::Metadata.new
    render :xml => meta.generate(settings)
  end

  private

  def saml_settings
    settings = Onelogin::Saml::Settings.new

    settings.assertion_consumer_service_url = "http://#{request.host}/saml/consume"
    settings.issuer = request.host
    settings.idp_sso_target_url = "https://login.lbl.gov/idp/profile/SAML2/Redirect/SSO"
    settings.idp_cert_fingerprint = BerkeleyFingerprint
    settings.name_identifier_format = "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
  end

  def authorize_success(user)
    session[:user] = user
  end

  def authorize_failure(user)
    puts "User could not be authenticated."
    flash[:error] = "Error during user authentication."
  end
end
