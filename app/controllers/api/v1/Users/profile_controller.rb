class Api::V1::Users::ProfileController < ApplicationController

	before_action :authenticate_user! 
	def show 
		if params[:id].to_i == current_user.id
			@user = User.find(params[:id])	
			@appointment = []
			Appointment.all.each do |i|
				property = Property.find(i.property_id)
				property_user = User.find(property.user_id)
				if @user.id == property_user.id	
					@appointment << i  
				end
			end
			render json: {appointment: @appointment, data: @user}
		else
			render json: {error: "You are not authorizes to access someone's profile"}
		end			
	end
end