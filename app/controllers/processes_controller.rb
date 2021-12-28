class ProcessesController < ApplicationController
  before_action :set_process, only: %i[ show edit update destroy ]

  # GET /processes or /processes.json
  def index
    @processes = Process.all
  end

  # GET /processes/1 or /processes/1.json
  def show
  end

  # GET /processes/new
  def new
    @process = Process.new
  end

  # GET /processes/1/edit
  def edit
  end

  # POST /processes or /processes.json
  def create
    @process = Process.new(process_params)

    respond_to do |format|
      if @process.save
        format.html { redirect_to process_url(@process), notice: "Process was successfully created." }
        format.json { render :show, status: :created, location: @process }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processes/1 or /processes/1.json
  def update
    respond_to do |format|
      if @process.update(process_params)
        format.html { redirect_to process_url(@process), notice: "Process was successfully updated." }
        format.json { render :show, status: :ok, location: @process }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processes/1 or /processes/1.json
  def destroy
    @process.destroy

    respond_to do |format|
      format.html { redirect_to processes_url, notice: "Process was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process
      @process = Process.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def process_params
      params.require(:process).permit(:step, :recipe_id)
    end
end
