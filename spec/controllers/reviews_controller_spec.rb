require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before(:example) do
    PlaceReview.destroy_all
  end
  describe "GET #show" do
    it "should return correct place json without authentication" do
      place = FactoryGirl.create :valid_place
      get :show, id: place.id
      expect(response).to have_http_status(:ok)
    end

    it "should assign correct @card" do
      place = FactoryGirl.create :valid_place
      get :show, id: place.id
      expect(assigns(:card)).to eq(place)
    end

    it "should render id, lat, lng, mark and title as json document" do
      required_keys = ["id", "title", "lat", "lng", "mark"]
      place = FactoryGirl.create :valid_place
      get :show, id: place.id
      json_response = JSON.parse(response.body)
      expect(json_response).to satisfy do |record|
        (record.keys & required_keys) == required_keys
      end
    end

    it "should render only id, lat, lng, mark, img, shortDescription, description, link and title" do
      allowed_keys = ["id", "title", "lat", "lng", "mark", "img", "shortDescription", "description", "link"]
      place = FactoryGirl.create :valid_place
      get :show, id: place.id
      json_response = JSON.parse(response.body)
      expect(json_response).to satisfy do |record|
        (record.keys - allowed_keys).empty?
      end
    end
  end
end
