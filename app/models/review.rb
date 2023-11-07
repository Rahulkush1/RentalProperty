class Review < ApplicationRecord
	belongs_to :reviewable, polymorphic: true
	belongs_to :user
	validates :rating, numericality: { in: 0..5 }
	belongs_to :property_id
end
