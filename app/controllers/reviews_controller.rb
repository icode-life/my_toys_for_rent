class ReviewsController < ApplicationController

  def new
    @toy = Toy.find (params[:toy_id])
    @review = Review.new
    authorize @review
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @review = Review.new(reviews_params)
    @review.toy = @toy
    authorize @review
    if @review.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end



end
