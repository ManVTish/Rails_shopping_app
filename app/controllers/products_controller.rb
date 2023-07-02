class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @query = Product.ransack(params[:query])
    @pagy, @products = pagy(@query.result)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
