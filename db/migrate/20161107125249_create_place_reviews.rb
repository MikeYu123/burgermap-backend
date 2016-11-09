class CreatePlaceReviews < ActiveRecord::Migration
  def change
    create_table :place_reviews do |t|
      t.string :title, index: true, null: false
      t.string :short_description
      t.string :image
      t.float :lat, null: false
      t.float :lng, null: false
      t.text :description
      t.float :mark, index: true, null: false
      t.string :link
      t.belongs_to :user, index: true

      t.index [:lat, :lng]
      t.timestamps null: false
    end
  end
end
