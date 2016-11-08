require 'rails_helper'

RSpec.describe PlaceReview, type: :model do
  it "Should be invalid without lat and lng" do
    place = FactoryGirl.build :place_without_coords
    expect(place).to_not be_valid
  end
  it "Should be invalid without title" do
    place = FactoryGirl.build :place_without_title
    expect(place).to_not be_valid
  end
  it "Should be invalid without mark" do
    place = FactoryGirl.build :place_without_mark
    expect(place).to_not be_valid
  end
  it "Should be valid with title, mark, lat and lng" do
    place = FactoryGirl.build :valid_place
    expect(place).to be_valid
  end
end
