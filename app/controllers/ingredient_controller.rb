class IngredientController < ApplicationController
  def show
    @ingredient = Recipe.new(ingredient_params)
  end
  def create
    @ingredient = Recipe.new(ingredient_params)
  end
  private

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end
end
