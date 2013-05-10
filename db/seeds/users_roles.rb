=begin

Role Key
1: do not use this. it is invalid for super_admin down the road
2: admin
3: scientist
4: content_manager

=end

Jerry.roles	<< Role.find(2)
Bryan.roles	<< Role.find(2)
Adam.roles	<< Role.find(3)
Kelly.roles	<< Role.find(4)

=begin
These don't get Roles because they are unconfirmed

Paul.roles	<< Role.find_by_name("")
Ben.roles		<< Role.find_by_name("")

=end
