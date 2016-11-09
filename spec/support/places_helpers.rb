module PlacesHelpers
  def create_place_with_latlng(attrs = {})
    lat_lng = attrs.slice(:lat, :lng)
    record_fields = FactoryGirl.attributes_for(:valid_place).merge(lat_lng)
    PlaceReview.create(record_fields)
  end

  def create_latlng()
    {
      lat: Faker::Address.latitude.to_f,
      lng: Faker::Address.longitude.to_f
    }
  end

  def create_filters(threshold, attrs)
    {
      lat_min: attrs[:lat] - threshold,
      lat_max: attrs[:lat] + threshold,
      lng_min: attrs[:lng] - threshold,
      lng_max: attrs[:lng] + threshold
    }
  end
end
