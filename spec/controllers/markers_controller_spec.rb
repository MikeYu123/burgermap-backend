require 'rails_helper'

RSpec.describe MarkersController, type: :controller do
  include PlacesHelpers
  before(:example) do
    # Flush table before setting up tests
    PlaceReview.destroy_all
    # Init some records
    num_places = 3
    places = FactoryGirl.create_list :valid_place, num_places
  end
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

      it "should render id, lat and lng for each marker in a json-array" do
        required_keys = ["id", "lat", "lng"]
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response).to satisfy do |records|
          records.all? {|record| (record.keys & required_keys) == required_keys }
        end
      end

      it "should render only id lat and lng for each marker in a json-array" do
        allowed_keys = ["id", "lat", "lng"]
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response).to satisfy do |records|
          records.all? {|record| (record.keys - allowed_keys).empty?}
        end
      end

    end

    context "when given lat and lng filters" do

      it "should return relevant marker when filters are given" do
        threshold = 0.1
        place_attrs = create_latlng

        test_place = create_place_with_latlng place_attrs

        filters = create_filters(threshold, place_attrs)
        get :index, filters

        expect(response).to have_http_status(:ok)
        expect(assigns(:markers).pluck(:id)).to include(test_place.id)
      end

      it "should return only relevant markers when filters are given" do
        threshold = 10
        place_attrs = create_latlng
        test_place = create_place_with_latlng place_attrs

        filters = create_filters(threshold, place_attrs)

        get :index, filters

        expect(response).to have_http_status(:ok)

        expect(assigns(:markers)).to satisfy do |records|
          records.all? do |record|
            (record.lat > filters[:lat_min]) &&
            (record.lat < filters[:lat_max]) &&
            (record.lng > filters[:lng_min]) &&
            (record.lng < filters[:lng_max])
          end
        end
      end
    end
  end
end
