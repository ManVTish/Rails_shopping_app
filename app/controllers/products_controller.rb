class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @product = Product.find_by(id: params[:id])
    render :show, status: :ok
  end

  def index
    @query = Product.ransack(params[:query])
    @query.sorts = ['created_at asc'] if @query.sorts.empty?
    @pagy, @products = pagy(@query.result)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
    render :index, status: :ok
  end
end
