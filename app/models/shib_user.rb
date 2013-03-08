class ShibUser < Struct.new(:cn, :email, :eppn, :given_name, :sn)




private

	def digest_shib_data
		shibuser 						= ShibUser.new
		shibuser.cn 				= request.env["HTTP_CN"]
		shibuser.email 			= request.env["HTTP_MAIL"]
		shibuser.eppn 			= request.env["HTTP_EPPN"]
		shibuser.given_name = request.env["HTTP_GIVENNAME"]
		shibuser.sn 				= request.env["HTTP_SN"]

		shibuser
	end

	# Make the above function into a loop
	# def loop_digest_shib_data(*attributes)
	# 	@shibuser = ShibUser.new
	# 	for attribute in attributes
	# 		request_attr = attribute.upcase.gsub("_","")
	# 		@shibuser.instance_variable_set(:"#{attribute}", request.env["HTTP_#{request_attr}"])
	# 	end
	# end

end