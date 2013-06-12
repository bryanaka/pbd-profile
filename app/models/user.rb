class User < ActiveRecord::Base
  rolify

  attr_accessible :name, :email, :eppn, :confirmed, :scientist_id

  validates :eppn, :name, :email, :presence => true 
	validates_uniqueness_of :eppn, :email, :name
  validates_uniqueness_of :scientist_id, :allow_nil => true, :allow_blank => true
  belongs_to :scientist


  # def current_user
  #   @user = User.find_by_eppn(session[:user_eppn])
  # end

  def new?
    false
  end

  def is_scientist?
    
  end

private
  
  def check_if_scientist
    # should automatically check the database for scientists 
    # with the same email on creation and then assign them as a scientist
  end

end
