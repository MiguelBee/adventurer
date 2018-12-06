class StaticPagesController < ApplicationController
  def index
  	@top_adventurers = User.paginate(page: params[:page], per_page: 15)
  	@top_adventures = Adventure.paginate(page: params[:page], per_page: 15)
    @moto_trekkers = User.where(adventurer_type: 'Moto Trekker').paginate(page: params[:page], per_page: 15)
    @backpackers = User.where(adventurer_type: 'Backpacker').paginate(page: params[:page], per_page: 15)
    @boaters = User.where(adventurer_type: 'Boater').paginate(page: params[:page], per_page: 15)
    @drivers = User.where(adventurer_type: 'RV-er/Road Tripper').paginate(page: params[:page], per_page: 15)
    @bicyclers = User.where(adventurer_type: 'Bicycler').paginate(page: params[:page], per_page: 15)
  end

  def contact; end

  def about; end

	private

	def highest_voted
		order('votes DESC')
	end

end
