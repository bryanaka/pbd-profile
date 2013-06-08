class ShibbolethData
	attr_reader :eppn, :email, :name

	def initialize(eppn, email, name)
		@eppn  = request.env["HTTP_EPPN"] || eppn.downcase
		@email = request.env["HTTP_MAIL"] || email.downcase
		@name  = request.env["HTTP_CN"]   || name.downcase.capitalize
	end

	def eppn=(value)
		@eppn = value.downcase
	end

	def email=(value)
		@email = value.downcase
	end

	def name=(value)
		@name = value.downcase.capitalize
	end

	#dependancy injection?
	def has_user?
		User.find_by_eppn(http_eppn)
	end

end