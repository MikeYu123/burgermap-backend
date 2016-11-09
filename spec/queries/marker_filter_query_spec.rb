require 'rails_helper'

RSpec.describe MarkerFilterQuery do
  extend PlacesHelpers
  
  threshold = 0.1
  deviance = 1

  right_attrs = create_latlng
  wrong_attrs = {
    lat: right_attrs[:lat] + deviance,
    lng: right_attrs[:lng] - deviance
  }

  filters = create_filters(threshold, right_attrs)

  right_place = create_place_with_latlng right_attrs
  wrong_place = create_place_with_latlng wrong_attrs

  it "should filter reviews by lat and lng" do
    records = MarkerFilterQuery.new.filter(filters)
    expect(records).to include(right_place)
    expect(records).to_not include(wrong_place)
  end
end
