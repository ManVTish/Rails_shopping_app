class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @products = Product.all.each
  end
end
