class ApplicationController < ActionController::Base
	protect_from_forgery unless: -> { request.format.json? }
	# before_action :configure_permitted_parameters, if: :devise_controller?
	rescue_from CanCan::AccessDenied do |exception|
   		redirect_to root_url, :alert => exception.message
 	end

 	rescue_from ActiveRecord::RecordInvalid do |exception|
   		redirect_to root_url, :alert => exception.message
 	end

	def not_found
    	# render :file => "#{RAILS_ROOT}/public/404.html"
  	end


  	# protected

	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up,keys:[:first_name, :last_name, :contact_no, :role])
	# end
end
