module ApplicationHelper
	
	def profile_owner?
		current_user == @user
	end

	def adventure_owner?
		current_user == @adventure.user
	end

end
