class InvestmentspartsController < ApplicationController
  before_action :set_investmentspart, only: %i[ show edit update destroy ]

  # GET /investmentsparts or /investmentsparts.json
  def index
    @investmentsparts = Investmentspart.all
  end

  # GET /investmentsparts/1 or /investmentsparts/1.json
  def show
  end

  # GET /investmentsparts/new
  def new
    @investmentspart = Investmentspart.new
  end

  # GET /investmentsparts/1/edit
  def edit
  end

  # POST /investmentsparts or /investmentsparts.json
  def create
    @investmentspart = Investmentspart.new(investmentspart_params)

    respond_to do |format|
      if @investmentspart.save
        format.html { redirect_to investmentspart_url(@investmentspart), notice: "Investmentspart was successfully created." }
        format.json { render :show, status: :created, location: @investmentspart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investmentspart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investmentsparts/1 or /investmentsparts/1.json
  def update
    respond_to do |format|
      if @investmentspart.update(investmentspart_params)
        format.html { redirect_to investmentspart_url(@investmentspart), notice: "Investmentspart was successfully updated." }
        format.json { render :show, status: :ok, location: @investmentspart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investmentspart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investmentsparts/1 or /investmentsparts/1.json
  def destroy
    @investmentspart.destroy

    respond_to do |format|
      format.html { redirect_to investmentsparts_url, notice: "Investmentspart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investmentspart
      @investmentspart = Investmentspart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investmentspart_params
      params.require(:investmentspart).permit(:part_id, :investment_id)
    end
end
