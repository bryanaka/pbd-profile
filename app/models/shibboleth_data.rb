class ShibbolethData
	attr_writer :user
	attr_reader :eppn, :email, :name, :user

	class UserNotFound < StandardError
	end



	def initialize(request, *args)
		self.eppn  = request.env["HTTP_EPPN"] || args[0]
		self.email = request.env["HTTP_MAIL"] || args[1]
		self.name  = request.env["HTTP_CN"]   || args[2]
		begin
			self.user
			raise ShibbolethData::UserNotFound.new unless @user
		rescue ShibbolethData::UserNotFound
			# self.user = nil
		end
	end

	def eppn=(eppn)
		@eppn = eppn.downcase
	end

	def email=(email)
		@email = email.downcase
	end

	def name=(name)
		@name = capitalize_all_names(name)
	end

	def user
		@user ||= User.find_by_eppn(@eppn)
	end

	#dependancy injection?
	def has_user?
		@user != nil ? true : false
	end

	def confirmed?
		if @user != nil
			return @user.confirmed?
		else 
			return false
		end
	end

	def valid?
		if !eppn || !email || !name
			return false
		else
			return true
		end 
	end

private
	
	def capitalize_all_names(name)
		parts = []
		name.sub(/\-/, "=\-").split(/\s|\-/).each do |part| 
			part.capitalize!
			parts.push(part) 
			parts
		end
		new_name = parts.join(" ").sub(/\=\s/, "-")
		new_name
	end

end