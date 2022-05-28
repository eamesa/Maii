class FondosController < ApplicationController
  before_action :set_fondo, only: %i[ show edit update destroy ]

  # GET /fondos or /fondos.json
  def index
    @fondos = Fondo.all
  end

  # GET /fondos/1 or /fondos/1.json
  def show
  end

  # GET /fondos/new
  def new
    @fondo = Fondo.new
  end

  # GET /fondos/1/edit
  def edit
  end

  # POST /fondos or /fondos.json
  def create
    @fondo = Fondo.new(fondo_params)

    respond_to do |format|
      if @fondo.save
        format.html { redirect_to fondo_url(@fondo), notice: "Fondo was successfully created." }
        format.json { render :show, status: :created, location: @fondo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fondo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fondos/1 or /fondos/1.json
  def update
    respond_to do |format|
      if @fondo.update(fondo_params)
        format.html { redirect_to fondo_url(@fondo), notice: "Fondo was successfully updated." }
        format.json { render :show, status: :ok, location: @fondo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fondo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fondos/1 or /fondos/1.json
  def destroy
    @fondo.destroy

    respond_to do |format|
      format.html { redirect_to fondos_url, notice: "Fondo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fondo
      @fondo = Fondo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fondo_params
      params.require(:fondo).permit(:nombre_fondo, :admin_id, :tipo_fondo, :codigo_tipo_fondo, :codigo_fondo, :tipo_participaciones_count)
    end
end
