class User < ActiveRecord::Base
  rolify
	validates_uniqueness_of :eppn, :email, :name
end
