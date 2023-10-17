class AppointmentMailer < ApplicationMailer
	  default from: 'rahulkushwaha191121@gmail.com'
	  def appointment_mail(appointment)	  	
	    # @user = params[:user]
	    @appointment = appointment
	    @property = Property.find(appointment.property_id)
	    @property_user_ = User.find(@property.user_id)
	    mail(to: @property_user_.email, subject: "Your upcoming appointment on Date : #{appointment.date.strftime('%a, %dth %b %Y')}")	
	  end
end
