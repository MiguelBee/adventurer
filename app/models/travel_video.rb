class TraveVideo < Post
	before_save :set_post_type

	def set_post_type
		self.post_type = "TravelVideo"
	end	
end