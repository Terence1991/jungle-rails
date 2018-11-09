class Review < ActiveRecord::Base
  validates :product_id, :description, :user_id, :rating,  presence: true
end
