class StaticPagesController < ApplicationController
  def index 
    @moto_trekkers = User.where(adventurer_type: "Moto Trekker").all
    @backpackers = User.where(adventurer_type: "Backpacker").all
    @boaters = User.where(adventurer_type: "Boater").all
    @drivers = User.where(adventurer_type: "RV-er/Road Tripper").all
    @bicyclers = User.where(adventurer_type: "Bicycler").all
  end

  def contact
  end

  def about
  end
end
