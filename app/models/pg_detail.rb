class PgDetail < ApplicationRecord
	belongs_to :property
	enum sharing_type: ["Double", "Three", "Four", "Five"]
end
