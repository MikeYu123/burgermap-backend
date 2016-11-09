class MarkersController < ApplicationController
  def index
    filters = params.slice(:lat_min, :lng_min, :lat_max, :lng_max)
    places = MarkerFilterQuery.new.filter(filters)
    @markers = places.select(:id, :lat, :lng)
    render json: @markers
  end
end
