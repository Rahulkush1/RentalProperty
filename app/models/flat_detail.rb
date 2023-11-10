class FlatDetail < ApplicationRecord
	belongs_to :property, inverse_of: :flat_detail
  	enum flat_type: [ "SELECT" ,"BHK", "TWO BHK", "THREE BHK"]
end
