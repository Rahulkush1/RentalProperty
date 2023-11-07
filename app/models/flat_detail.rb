class FlatDetail < ApplicationRecord
	validates :flat_type,:available_for, :area, presence: true
	belongs_to :property, inverse_of: :flat_detail
  	# enum flat_type: {
  	# 	Select: -1,
	#     BHK: 0,
	#     Two_BHK: 1,
	#     Three_BHK: 2
  	# }
  	enum flat_type: [ "SELECT" ,"BHK", "TWO BHK", "THREE BHK"]
end
