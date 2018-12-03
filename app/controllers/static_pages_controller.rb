class StaticPagesController < ApplicationController
  def index
    @moto_trekkers = User.paginate(page: params[:page], per_page: 5).where(adventurer_type: 'Moto Trekker')
    @backpackers = User.paginate(page: params[:page], per_page: 5).where(adventurer_type: 'Backpacker')
    @boaters = User.paginate(page: params[:page], per_page: 5).where(adventurer_type: 'Boater')
    @drivers = User.paginate(page: params[:page], per_page: 5).where(adventurer_type: 'RV-er/Road Tripper')
    @bicyclers = User.paginate(page: params[:page], per_page: 5).where(adventurer_type: 'Bicycler')
  end

  def contact; end

  def about; end
end
