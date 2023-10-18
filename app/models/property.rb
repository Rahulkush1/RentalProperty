class Property < ApplicationRecord
	resourcify
	has_and_belongs_to_many :amenities, :join_table => :amenities_properties, dependent: :destroy
	has_one :address, as: :addressable,dependent: :destroy
	belongs_to :user
	has_many_attached :images
	has_many :flat_details, dependent: :destroy
	accepts_nested_attributes_for :flat_details, allow_destroy: true
	accepts_nested_attributes_for :amenities, allow_destroy: true
	accepts_nested_attributes_for :address, allow_destroy: true

	scope :filter_by_name, -> (name) {where(name: name)}

	enum publish: {
	    NO: 0,
	    YES: 1,
  	}

	enum status: {
	    available: 0,
	    sold: 1,
	    pending: 2 
  	}

  	enum prop_type: {
  		Select: -1,
	    Flat: 0,
	    PG: 1,
	    Room: 2
  	}



  	def self.ransackable_attributes(auth_object = nil)
    	["blob_id", "created_at", "id", "name", "record_id", "record_type","created_at", "flat_type", "id", "name", "price", "prop_type", "publish", "status", "updated_at", "user_id"]
  	end

  	def self.ransackable_associations(auth_object = nil)
    	["address", "amenities", "images_attachments", "images_blobs", "roles", "user"]
  	end



end
