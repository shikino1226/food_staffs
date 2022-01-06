class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[ destroy ]

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to (recipe_url (@recipe_food.recipe.id)), notice: "Recipe food was successfully created." }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to (recipe_url (@recipe_food.recipe.id)), notice: "Recipe food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end

    def recipe_food_params
      params.require(:recipe_food).permit(:contents, :recipe_id, :process_id, :quantity)
    end
end
