class Api::V1::PropertiesController < ApplicationController
	before_action :authenticate_user!
  	load_and_authorize_resource
  	skip_before_action :verify_authenticity_token

	def index
		if params[:user_id].to_i == current_user.id

			@property = User.find(params[:user_id]).properties.all
			render json:{data: @property}
		else
			render json: {error: "Something went wrong" }
		end
	end 

	def show 
		if params[:user_id].to_i == current_user.id
			@user = User.find(params[:user_id])
			@property = Property.find(params[:id])
			render json: {data: @property,message: "property fetched successfully"}
		else
			render json: @property.errors, status: :unprocessable_entity
		end
	end 

	def new 
		@user = User.find(params[:user_id])
		@property = Property.new
		@property.flat_details.build	
	end

	def create 
		@property = current_user.properties.new(property_params)
		if @property.save!
			render json: {data: @property,flat_details: @property.flat_details,amenities: @property.amenities,address: @property.address,message: "property created successfully"}, status: :created
		else
			render json:{error: "Something went wrong!"}
		end
	end

	def edit 
		@user = current_user
	end


	def update
		@property = Property.find(params[:id])
		if @property.update(property_params)
			render json: {data: @property,flat_details: @property.flat_details,amenities: @property.amenities,address: @property.address,message: "property created successfully"}, status: :ok
		else
			render json: @property.errors, status: :unprocessable_entity
		end
		#   if @property.update(property_params.reject {|k| k["images"]})	
		#   	if modified_property_params[:images].present?
		#   		modified_property_params[:images].each do |image|
		#   			@property.images.attach(image)
		#   		end
		#   	end
		#   	 @property.create_address( address_params )
      	# 	render json: {data: @property,message: "property updated successfully"}
    	# else
      	# 	render json:{error: "Something went wrong!"}
    	# end
    end

    def destroy
    	@user =  User.find(params[:user_id])
    	@property = @user.properties.find(params[:id])
    	@property.images.each do |i|
    		i.purge
    	end
    	@property.destroy
    	render json:{message: "property deleted successfully"  }, status: :see_other
    end

    def delete_image_attachment
    	@property_image = ActiveStorage::Attachment.find(params[:property_id])
    	@property_image.purge
    	render json: { message: "image deleted successfully"}
    end

	protected

	def property_params		
		params.require(:property).permit(:name, :price,:status, :publish, flat_details_attributes: [:flat_type, :area, :available_for], amenity_ids: [], address_attributes: [:address, :street, :city, :country])
	end
end
