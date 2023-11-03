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
		@property = @user.properties.build
		@property.build_flat_detail
	end

	def create 
		@property = current_user.properties.new(property_params)
		if @property.save!
			redirect_to root_path
		else
			render :new,status: :unprocessable_entity
		end
	end

	def edit 
		@user = User.find(params[:user_id])
	end


	def update
		@property = Property.find(params[:id])
		  if @property.update(property_params.reject {|k| k["images"]})
		  	if property_params[:images].present?
		  		property_params[:images].each do |image|
		  			@property.images.attach(image)
		  		end
		  	end
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
		if params[:property][:prop_type] != "Flat"
			params.require(:property).permit(:name, :price,:prop_type, :status, :publish, amenity_ids: [], address_attributes: [:address, :street, :city, :country],images: [])
		else
			params.require(:property).permit(:name, :price,:prop_type, :status, :publish, flat_detail_attributes: [:flat_type, :area, :available_for], amenity_ids: [], address_attributes: [:address, :street, :city, :country],images: [])
		end	
	end

end
