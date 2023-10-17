class FlatDetail < ApplicationRecord
	belongs_to :property, inverse_of: :flat_details
  	enum flat_type: {
  		Select: -1,
	    BHK: 0,
	    Two_BHK: 1,
	    Three_BHK: 2
  	}


end
