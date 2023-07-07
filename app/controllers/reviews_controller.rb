class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :find_product, only: %i[new create index destroy]

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product.id) }
        format.turbo_stream { flash.now[:notice] = "Added new review." }
      end
    else
      render :new, status: :unprocessable_entity
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def index
    # use ransack here for review sorting & pagination
    @reviews = @product.reviews
  end

  def destroy
    @review = @product.reviews.find_by(id: params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to product_path(@product.id) }
      format.turbo_stream
    end
  end

  private

  def find_product
    @product = Product.find_by(id: params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id).tap do |review_param|
      review_param[:rating] = review_param[:rating].to_i
    end
  end
end
