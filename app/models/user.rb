class User < ActiveRecord::Base
  attr_accessible :eppn, :email, :name
  rolify
	validates_uniqueness_of :eppn, :email, :name
end
