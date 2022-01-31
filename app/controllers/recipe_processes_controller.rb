class RecipeProcessesController < ApplicationController
  before_action :set_recipe_process, only: %i[ destroy ]

  def create
    @recipe_process = RecipeProcess.new(recipe_process_params)
    respond_to do |format|
      if @recipe_process.save
        format.html { redirect_to (recipe_url (@recipe_process.recipe.id)), notice: "Recipe process was successfully created." }
        format.json { render :show, status: :created, location: @recipe_process }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_process.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_process.destroy
    respond_to do |format|
      format.html { redirect_to (recipe_url (@recipe_process.recipe.id)), notice: "Recipe process was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe_process
      @recipe_process = RecipeProcess.find(params[:id])
    end

    def recipe_process_params
      params.require(:recipe_process).permit(:step, :recipe_id)
    end
end
