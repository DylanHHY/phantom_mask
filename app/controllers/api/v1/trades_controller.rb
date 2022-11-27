class Api::V1::TradesController < ApplicationController
  def index
    @q = PurchaseHistory.ransack(params[:q])
  end
end
