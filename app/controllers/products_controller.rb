class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @products = if params[:category_ids]
        Product.where(category_id: params[:category_ids])
      else
        Product.all
      end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
