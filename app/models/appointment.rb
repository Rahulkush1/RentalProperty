class Appointment < ApplicationRecord
	belongs_to :user

	enum status: {
	    approved: 1,
	    rejected: 0,
	    pending: 2,
  	}
  	enum visit_status: {
	    visited: 1,
	    visit_rejected: 2,
	    visit_pending: 0,
  	}
  	def self.ransackable_attributes(auth_object = nil)
    	["created_at", "date", "id", "name", "phone", "property_id", "status", "time", "updated_at", "user_id", "visit_status"]
  	end
end
