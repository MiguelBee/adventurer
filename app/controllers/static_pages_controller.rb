class StaticPagesController < ApplicationController
  def index 
  end

  def contact
  end

  def about
  end

  def moto_trekkers_show
  	@moto_trekkers = User.where(adventurer_type: "Moto Trekker").all
  end

  def backpackers_show
  	@backpackers = User.where(adventurer_type: "Backpacker").all
  end

  def boaters_show
  	@boaters = User.where(adventurer_type: "Boater").all
  end

  def rvers_show
  	@drivers = User.where(adventurer_type: "RV-er/Road Tripper").all
  end

  def bicyclers_show
  	@bicyclers = User.where(adventurer_type: "Bicycler").all
  end
end
