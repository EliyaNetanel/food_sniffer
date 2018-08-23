class ScansController < ApplicationController
   # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!#, only: [:home]
  def new
    @scan = Scan.new
  end

  def get_product
    # product_code = params[:upc]
    # product_info = GetProductService.new(product_code).call
    diet = current_user.diet

    # result = diet.check_product(product_info[:ingredients])
    result = diet.check_product(["milk","water","sugar"])

    # render :json => {product: product_info}
    # result = true
    scan = Scan.new()
    scan.user = current_user
    scan.result = result
    # raise
    scan.save
    redirect_to scan_path(scan)


  end

  # def create
  #   raise
  #   redirect_to root_path
  #   @scan = Scan.new
  #   @scan.user = current_user
  #   @scan.result = call_to_api
  #   @scan.save
  # end

  def show
    @scan = Scan.find(params[:id])
  end




end
