class FavoritosController < ApplicationController
  before_action :set_favorito, only: %i[ show edit update destroy ]

  # GET /favoritos or /favoritos.json
  def index
    @favoritos = Favorito.all
  end

  # GET /favoritos/1 or /favoritos/1.json
  def show
  end

  # GET /favoritos/new
  def new
    @favorito = Favorito.new
  end

  # GET /favoritos/1/edit
  def edit
  end

  # POST /favoritos or /favoritos.json
  def create
    @favorito = Favorito.new(favorito_params)

    respond_to do |format|
      if @favorito.save
        format.html { redirect_to favorito_url(@favorito), notice: "Favorito was successfully created." }
        format.json { render :show, status: :created, location: @favorito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favoritos/1 or /favoritos/1.json
  def update
    respond_to do |format|
      if @favorito.update(favorito_params)
        format.html { redirect_to favorito_url(@favorito), notice: "Favorito was successfully updated." }
        format.json { render :show, status: :ok, location: @favorito }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritos/1 or /favoritos/1.json
  def destroy
    @favorito.destroy

    respond_to do |format|
      format.html { redirect_to favoritos_url, notice: "Favorito was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorito
      @favorito = Favorito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorito_params
      params.require(:favorito).permit(:part_id, :user_id)
    end
end
