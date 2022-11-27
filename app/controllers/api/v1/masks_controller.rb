class Api::V1::MasksController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @masks = Mask.all
    render json:@masks
  end
  
  def new
    @mask = Mask.new
  end
  
  def create
    @mask = mask.new(mask_params)
    if @mask.save
      render json: mask, status: 200
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
    if @mask.update(mask_params)
      render json: @mask, status:200
    else
      render json:{error: "update failed"}
    end
  end
  
  def destroy
    @mask.destroy
  end
  
  private
  def find_mask
    @mask = Mask.find(params[:id])
  end

  def mask_params
    params.require(:mask).permit(:name, :price)
  end
end