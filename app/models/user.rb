class User < ActiveRecord::Base
	validates_uniqueness_of :eppn, :email, :name
end
