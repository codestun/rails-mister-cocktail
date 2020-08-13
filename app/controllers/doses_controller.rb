class DosesController < ApplicationController
  # def create
  #   @cocktail = Cocktail.find([:cocktails_id])
  # end

  def index
    @doses = Dose.all
  end
end
