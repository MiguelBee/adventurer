class StaticPagesController < ApplicationController
  def index
  	@pagy, @top_adventurers = pagy(User.all)
  	@pagy, @top_adventures = pagy(Adventure.all)
    @pagy, @moto_trekkers = pagy(User.where(adventurer_type: 'Moto Trekker'))
    @pagy, @backpackers = pagy(User.where(adventurer_type: 'Backpacker'))
    @pagy, @boaters = pagy(User.where(adventurer_type: 'Boater'))
    @pagy, @drivers = pagy(User.where(adventurer_type: 'RV-er/Road Tripper'))
    @pagy, @bicyclers = pagy(User.where(adventurer_type: 'Bicycler'))
  end

  def contact; end

  def about; end

	private

	def highest_voted
		order('votes DESC')
	end

end
