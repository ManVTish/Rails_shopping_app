class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :find_product, only: %i[new create index destroy]

  def create
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save!
      respond_to do |format|
        format.html { redirect_to product_path(@product.id) }
        format.turbo_stream { flash.now[:notice] = 'Added new review.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@review, partial: "reviews/form", locals: { review: @review }) }
      end
    end
  end

  private

  def find_product
    @product = Product.find_by(id: params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :product_id)
  end
end
