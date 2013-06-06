class User < ActiveRecord::Base
  rolify

  attr_accessible :name, :email, :eppn, :confirmed, :scientist_id

  validates :eppn, :name, :email, :presence => true 
	validates_uniqueness_of :eppn, :email, :name
  validates_uniqueness_of :scientist_id, :allow_nil => true, :allow_blank => true


  # def current_user
  #   @user = User.find_by_eppn(session[:user_eppn])
  # end

  def new?
    false
  end

end
