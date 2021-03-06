class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create ]

  def new
    # cocktail is found via the before_action
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to @cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
