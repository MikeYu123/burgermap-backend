class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          # Temporarily not confirmable
          # :confirmable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :place_reviews
end
