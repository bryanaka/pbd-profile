class User < ActiveRecord::Base
	validates_uniqueness_of :eppn, :mail, :name
end
