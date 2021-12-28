class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[ show edit update destroy ]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.update(recipe_food_params)
      redirect_to (recipe_url (@recipe_food.recipe.id))
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(id: @recipe.id), status: :updated
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: "Recipe food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_food_params
      params.require(:recipe_food).permit(:contents, :recipe_id, :process_id)
    end
end
