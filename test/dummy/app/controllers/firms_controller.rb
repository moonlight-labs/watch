class FirmsController < ApplicationController

  # GET /firms
  def index
    firms = Firm.all

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

end
