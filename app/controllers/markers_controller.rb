class MarkersController < ApplicationController
  def index
    @markers = PlaceReview.all.select(:id, :lat, :lng)
    render json: @markers
  end
end
