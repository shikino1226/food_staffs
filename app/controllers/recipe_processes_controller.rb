class RecipeProcessesController < ApplicationController
  before_action :set_recipe_process, only: %i[ show edit update destroy ]

  # GET /recipe_processes or /recipe_processes.json
  def index
    @recipe_processes = RecipeProcess.all
  end

  # GET /recipe_processes/1 or /recipe_processes/1.json
  def show
  end

  # GET /recipe_processes/new
  def new
    @recipe_process = RecipeProcess.new
  end

  # GET /recipe_processes/1/edit
  def edit
  end

  # POST /recipe_processes or /recipe_processes.json
  def create
    @recipe_process = RecipeProcess.new(recipe_process_params)

    respond_to do |format|
      if @recipe_process.save
        format.html { redirect_to recipe_process_url(@recipe_process), notice: "Recipe process was successfully created." }
        format.json { render :show, status: :created, location: @recipe_process }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_processes/1 or /recipe_processes/1.json
  def update
    respond_to do |format|
      if @recipe_process.update(recipe_process_params)
        format.html { redirect_to recipe_process_url(@recipe_process), notice: "Recipe process was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_process }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_processes/1 or /recipe_processes/1.json
  def destroy
    @recipe_process.destroy

    respond_to do |format|
      format.html { redirect_to recipe_processes_url, notice: "Recipe process was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_process
      @recipe_process = RecipeProcess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_process_params
      params.require(:recipe_process).permit(:step, :recipe_id)
    end
end
