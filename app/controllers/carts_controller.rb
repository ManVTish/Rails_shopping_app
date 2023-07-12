class CartsController < ApplicationController
  before_action :find_product

  def create
    @cart = current_cart || Cart.new(user_id: current_user.id)
    if @cart.save
      add_product
      render notice: 'Cart added successfully'
    else
      render notice: 'Failed to add to cart'
    end

    respond_to(&:turbo_stream)
  end

  def cart_products
    @cart = current_user.cart
    @cart_products = @cart&.products
  end

  private

  def add_product
    @cart.products << @product unless @cart.products&.where(id: @product.id).present?
    @item = @cart.cart_items.where(product_id: @product.id).first
    @item.quantity += 1
    @item.save
  end

  def current_cart
    current_user.cart
  end

  def find_product
    @product = Product.find_by(id: params[:product_id])
  end

  def cart_params
    params.require(:cart).permit(:product_id)
  end
end
