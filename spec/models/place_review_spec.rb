require 'rails_helper'

RSpec.describe PlaceReview, type: :model do
  it "Should be invalid without lat and lng"
  it "Should be invalid without title"
  it "Should be invalid without mark"
  it "Should be valid with title, mark, lat and lng"
  it "Should persist all fields"
end
