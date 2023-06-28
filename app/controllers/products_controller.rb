class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @products = if params[:category_checkbox]
                  Category.filter_by_category.products.all
                else
                  Product.all.each
                end
  end
end
