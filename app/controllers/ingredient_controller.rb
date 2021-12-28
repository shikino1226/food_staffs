class IngredientController < ApplicationController
  def show
    @ingredient = Recipe.new(ingredient_params)
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@ingredient.recipe_id)
    end
  end
  private

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end
end
