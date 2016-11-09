class ReviewsController < ApplicationController
  def show
    @card = PlaceReview.find(params[:id])
    render json: JsonPresenters.present_card(@card)
  end
end
