class PoniesController < ApplicationController
  before_action :set_pony, only: %i[ show edit update destroy ]

  # GET /ponies or /ponies.json
  def index
    @ponies = Pony.all
  end

  # GET /ponies/1 or /ponies/1.json
  def show
  end

  # GET /ponies/new
  def new
    @pony = Pony.new
  end

  # GET /ponies/1/edit
  def edit
  end

  # POST /ponies or /ponies.json
  def create
    @pony = Pony.new(pony_params)

    respond_to do |format|
      if @pony.save
        format.html { redirect_to @pony, notice: "Pony was successfully created." }
        format.json { render :show, status: :created, location: @pony }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ponies/1 or /ponies/1.json
  def update
    respond_to do |format|
      if @pony.update(pony_params)
        format.html { redirect_to @pony, notice: "Pony was successfully updated." }
        format.json { render :show, status: :ok, location: @pony }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ponies/1 or /ponies/1.json
  def destroy
    @pony.destroy
    respond_to do |format|
      format.html { redirect_to ponies_url, notice: "Pony was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pony
      @pony = Pony.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pony_params
      params.require(:pony).permit(:name, :description)
    end
end
