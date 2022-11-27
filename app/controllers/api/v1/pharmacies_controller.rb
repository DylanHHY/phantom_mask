class Api::V1::PharmaciesController < ApplicationController
  before_action :find_pharmacy, only: [:show, :edit, :update, :destroy]
  def index
    @pharmacies = Pharmacy.all
    render json:@pharmacies
  end

  def new
    @pharmacy = Pharmacy.new
  end
  
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    if @pharmacy.save
      render json: pharmacy, status: 200
    else
      render json: {error: "create failed!"}
    end
  end
  
  def show
    begin @pharmacy
      render json: @pharmacy, status: 200
    rescue
      render json: {error: 'pharmacy not found!'}
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def day_of_week

  
  end
  
  def open_at_day
    
  end

  private
  def find_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end

  def pharmacy_params
    params.require(:pharmacy).permit(:name, :cash_balance)
  end

end
