class User < ActiveRecord::Base

  attr_accessible :name, :email, :eppn, :confirmed
  rolify
	validates_uniqueness_of :eppn, :email, :name

  def intialize(options_hash)
    self.name = options_hash["HTTP_CN"]
    self.email = options_hash["HTTP_MAIL"]
    self.eppn = options_hash["HTTP_EPPN"]
  end

  def new?
    false
  end

end
