class PlaceReview < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :lat
  validates_presence_of :lng
  validates_presence_of :title
  validates_presence_of :mark
end
