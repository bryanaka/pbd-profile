class User < ActiveRecord::Base
  attr_reader :eppn, :email, :name
  rolify
	validates_uniqueness_of :eppn, :email, :name
end
