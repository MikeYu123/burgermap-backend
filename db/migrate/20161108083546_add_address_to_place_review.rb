class AddAddressToPlaceReview < ActiveRecord::Migration
  def change
    add_column :place_reviews, :address, :string
  end
end
