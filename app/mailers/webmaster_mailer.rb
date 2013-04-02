class WebmasterMailer < ActionMailer::Base
  default to: "jerrychung@lbl.gov"

  def confirm_user_email(user)
    @user = user
    mail(from: user.email, subject: "New User Confirmation")
  end
end
