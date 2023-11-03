class RentPropertiesController < ApplicationController

	def index 
		@property = Property.where(publish: 1).page(params[:page])

		# @property = Property.all

		if params[:sort_option] == "low_to_high"
			
			@property = @property.order(price: :asc)
		end
		if params[:sort_option] == "high_to_low"	
			@property = @property.order(price: :desc)
		end
		if params[:sort_option] == "name"
			@property = @property.order(name: :asc)
		end
		if params[:status] == "sold"
			
			@property = @property.where(status: "sold")

		end
		if params[:status] == "available"
			@property = @property.where(status: "available")
		end
		if params[:status] == "pending"
			@property = @property.where(status: "pending")
		end
		if params[:min_price].present? && params[:max_price].present?
			@property  = @property.where('price BETWEEN ? AND ?',params[:min_price],params[:max_price])
			
		end
		if params[:posted] == "owner" or params[:posted] == "broker"
			
			@properties = []
			@property.each do |prop|
				user = User.find(prop.user_id)
				user.roles.each do |role|
					if role.name != "user"
						if role.name == params[:posted]
							@properties << prop
						end
					end
				end
			end
			@property = @properties
		end

	end

	def show 
		@property = Property.find(params[:id])
	end

	def search
		# binding.pry
		 key = "%#{params[:key]}%"
		 # key = "#{params[:key]}"

		# @property = Property.all
		if key != "%%"
			@property = Property.where("name LIKE ? or prop_type LIKE ? or flat_type LIKE ? ",key,prop_type_key(key),flat_type_key(key))
		end

	end

	def prop_type_key(key)
		if key.downcase == "%flat%" 
		 	key = 0
		elsif key.downcase == '%pg%'
		 	key = 1
		else 
		 	key = 2	
		end
		return key 
	end

	def flat_type_key(key)
		if key.downcase == "%bhk%" 
		 	key = 0
		elsif key.downcase == '%twobhk%' 
		 	key = 1
		elsif key.downcase == '%threebhk%' || key.downcase == '% 3 bhk%' || key.downcase == '% three bhk%'
		 	key = 2	
		end
		return key 
	end


	# def Filter_for_flat
	# 	@filterproperties = Property.where.not(prop_type: 1).where.not(prop_type: 2)
	# end

end
