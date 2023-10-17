class Address < ApplicationRecord
	belongs_to :addressable, polymorphic: true
	 def self.ransackable_attributes(auth_object = nil)
    	["address", "addressable_id", "addressable_type", "city", "country", "created_at", "id", "street", "updated_at"]
  	end

end
