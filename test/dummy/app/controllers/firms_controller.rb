class FirmsController < ApplicationController
  #before_action :set_firm, only: [:show]

  # GET /firms
  def index
    firms = Firm.order('random()').limit(100)
    respond_to do |format|
      format.html { render locals: { firms: firms } }
      format.json { render json: firms }
    end
  end

  # GET /firms/1
  def show
    firm = Firm.find(params[:id])
    respond_to do |format|
      format.html { render locals: { firm: firm } }
      format.json { render json: firm }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_firm
    #   firm = Firm.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def firm_params
      params.require(:firm).permit(:index, :show)
    end
end
