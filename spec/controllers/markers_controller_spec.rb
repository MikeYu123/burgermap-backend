require 'rails_helper'

RSpec.describe MarkersController, type: :controller do
  # Flush table before setting up tests
  PlaceReview.destroy_all
  # Init some records
  num_places = 3
  places = FactoryGirl.create_list :valid_place, num_places
  describe "GET #index" do
    context "when given no lat and lng filters" do
      it "should not require authentication" do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "should return all markers" do
        get :index
        expect(assigns(:markers).length).to eq(3)
      end

      it "should render array with all markers" do
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.length).to eq(3)
      end

      it "should render only id, lat and lng for each marker" do
        get :index
        allowed_keys = ["id", "lat", "lng"]
        json_response = JSON.parse(response.body)
        expect(json_response).to satisfy do |records|
          records.all? {|record| (record.keys - allowed_keys).empty?}
        end
      end
    end

    context "when given lat and lng filters" do

      it "should return relevant marker when filters are given" do
        threshold = 0.1
        place_with_latlng = FactoryGirl.build :valid_place
        place_with_latlng.lat = Faker::Address.latitude
        place_with_latlng.lng = Faker::Address.longitude
        place_with_latlng.save

        lat_min = place_with_latlng.lat - threshold
        lng_min = place_with_latlng.lng - threshold
        lat_max = place_with_latlng.lat + threshold
        lng_max = place_with_latlng.lng + threshold

        get :index, lat_max: lat_max, lng_max: lng_max, lat_min: lat_min, lng_min: lng_min


        expect(response).to have_http_status(:ok)
        expect(assigns(:markers).pluck(:id)).to include(place_with_latlng.id)
      end

      it "should return only relevant markers when filters are given" do
        threshold = 10
        lat = Faker::Address.latitude
        lng = Faker::Address.longitude
        place_with_latlng = FactoryGirl.build :valid_place
        place_with_latlng.lat = lat
        place_with_latlng.lng = lng
        place_with_latlng.save

        lat_min = place_with_latlng.lat - threshold
        lng_min = place_with_latlng.lng - threshold
        lat_max = place_with_latlng.lat + threshold
        lng_max = place_with_latlng.lng + threshold

        get :index, lat_max: lat_max, lng_max: lng_max, lat_min: lat_min, lng_min: lng_min

        expect(response).to have_http_status(:ok)
        expect(assigns(:markers)).to satisfy do |records|
          records.all? do |record|
            (record.lat > lat_min) && (record.lat < lat_max) && (record.lng > min_lng) && (record.lng < max_lng)
          end
        end
      end
    end
  end
end
