class PropertiesController < ApplicationController
	before_action :authenticate_user!
  	load_and_authorize_resource
	def index
		# @property = Property.find(params[:id])
	end 

	def show 
		@user = User.find(params[:user_id])
		@property = Property.find(params[:id])
	end 

	def new 
		@user = User.find(params[:user_id])
		# @address = Address.new
		@property = Property.new
		# @property.create_address
		# @amenity  = @property.amenities.build
		# @property.address.build
		
	end

	# def address_params 
 	# 	params.require(:property).require(:address_attributes).permit(:address, :street, :city, :country )
	# end

	def create 
		
		modified_property_params = params.require(:property).permit(:name, :price,:prop_type,:flat_type, amenity_ids: [], images: [])
		
		# modified_property_params[:amenity_ids] = modified_property_params[:amenity_ids].map{|a| Amenity.find(a.to_i) if a != ""}.compact
		modified_property_params[:amenity_ids].delete("")
		modified_property_params[:amenity_ids]  = modified_property_params[:amenity_ids].map{|a| a.to_i }.compact

		# address_params = params.require(:property).require(:address).permit(:address, :street, :city, :country )
		address_params = params.require(:address).permit(:address,:street,:city,:country)



		

		# binding.pry

			 

		if modified_property_params[:prop_type] != "Flat"
			modified_property_params[:flat_type] = nil
		else
			modified_property_params[:flat_type] 
		end
		

		@property = current_user.properties.new(modified_property_params)
		# @property.images.attach(modified_property_params[:images])
		if @property.save!
			# binding.pry


		# 	@amenity = params[:amenities][:amenity_ids]
		# 	@amenity.map(&:to_i)
		# 	amenity_array = []
		# 	@amenity.each do |i|
		# 		amenity_array << Amenity.find(i)
		# 	end
		# 	@property.amenities << amenity_array
		# 	params[:address][:addressable] = @property.id
		# 	# binding.pry
		# 	# address = Address.new(params[:address])

		# 	# @property.address

			 @property.create_address( address_params )

			redirect_to root_path
		else
			render :new,status: :unprocessable_entity
		end
	end

	def edit 
		@user = current_user
	end


	def update
		modified_property_params = params.require(:property).permit(:name, :price,:prop_type,:status,:flat_type, amenity_ids: [], images: [])
		# modified_property_params[:amenity_ids] = modified_property_params[:amenity_ids].map{|a| Amenity.find(a.to_i) if a != ""}.compact
		modified_property_params[:amenity_ids].delete("")
		modified_property_params[:amenity_ids]  = modified_property_params[:amenity_ids].map{|a| a.to_i }.compact

		# address_params = params.require(:property).require(:address).permit(:address, :street, :city, :country )
		address_params = params.require(:address).permit(:address,:street,:city,:country)

		

		if params[:prop_type] != "Flat"
			params[:flat_type] = nil
		else
			params[:flat_type] 
		end
		@property = Property.find(params[:id])
		# @property.images.attach(modified_property_params[:images])
		  if @property.update(modified_property_params.reject {|k| k["images"]})
		  	if modified_property_params[:images].present?
		  		modified_property_params[:images].each do |image|
		  			@property.images.attach(image)
		  		end
		  	end
		  	 @property.create_address( address_params )

      		redirect_to user_property_path
    	else
      		render :edit,status: :unprocessable_entity
    	end
    end

    def updatePublish

    	@property = Property.find(params[:property_id])
    	if @property.update({"publish" => params[:publish_status].to_i})
    		redirect_to user_properties_path
    	else
    		render :edit, status: :unprocessable_entity
    	end
    end

    def destroy
    	@user =  User.find(params[:user_id])
    	@property = @user.properties.find(params[:id])
    	@property.images.each do |i|
    		i.purge
    	end
    	@property.destroy

    	redirect_to user_properties_path(@user), status: :see_other

    end

    def delete_image_attachment
    	@property_image = ActiveStorage::Attachment.find(params[:property_id])
    	@property_image.purge
    	redirect_to user_property_path
    end

	private

	def property_params
		# params.require(:property).permit(:name, :price,:prop_type,:flat_type, amenities: [])	
	end
end
