module ApplicationHelper
	
	def profile_owner?
		current_user == @user
	end

	def adventure_owner?
		current_user == @adventure.user
	end

	def adventurer_type
		adventurer_type = ["Moto Trekker", "Boater", "RV-er/Road Tripper", "Backpacker", "Bicycler"]
	end

end
