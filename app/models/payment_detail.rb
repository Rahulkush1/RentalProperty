class PaymentDetail < ApplicationRecord
	validates :property_id, uniqueness: true
end
