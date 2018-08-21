class ScansController < ApplicationController
  def new
    @scan = Scan.new
    # @food_item = FoodIten.new
    # @food_item.upc = params[:upc]
  end

  def get_barcode
    @food_item = FoodIten.find_or_initialize_by(upc: params[:upc])
    unless @product.new.record?
      redirect_to scan_path(@food_item)
    end
  end

  def create
    @scan = Scan.new
    @scan.user = current_user
    @scan.result = call_to_api
    @scan.save
  end

  def show
  end
end
