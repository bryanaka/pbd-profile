class User < ActiveRecord::Base
  has_one :scientist

  attr_accessible :name, :email, :eppn, :confirmed, :scientist_id
	validates_uniqueness_of :eppn, :email, :name


  # def current_user
  #   @user = User.find_by_eppn(session[:user_eppn])
  # end

  def new?
    false
  end

end
