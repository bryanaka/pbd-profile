class Ability
	include CanCan::Ability

	def initialize(user)
		# There is a problem with this...
		user ||= User.new
		if user.has_role? :superadmin
			can :manage, :all
		elsif user.has_role? :admin
			can :manage, [Scientist, ScientistProfile, ScientistWebsite, ScientistTitle, Video, News]
			can [:read, :update], User, :id => user.id
		elsif user.has_role? :scientist
			can :manage, [ScientistWebsite, ScientistTitle], :scientist_id => user.scientist_id
			can :update, Scientist, :id => user.scientist_id
			can :update, ScientistProfile, :scientist_id => user.scientist_id
			can :update, User, :id => user.id
			can :read, :all
		else
			can :update, User, :id => user.id
			can :read, :all
		end

	# Define abilities for the passed in user here. For example:
	#
	#   user ||= User.new # guest user (not logged in)
	#   if user.admin?
	#     can :manage, :all
	#   else
	#     can :read, :all
	#   end
	#
	# The first argument to `can` is the action you are giving the user permission to do.
	# If you pass :manage it will apply to every action. Other common actions here are
	# :read, :create, :update and :destroy.
	#
	# The second argument is the resource the user can perform the action on. If you pass
	# :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
	#
	# The third argument is an optional hash of conditions to further filter the objects.
	# For example, here the user can only update published articles.
	#
	#   can :update, Article, :published => true
	#
	# See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

	end
end
