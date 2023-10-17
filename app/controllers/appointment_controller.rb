class AppointmentController < ApplicationController
  def new
    
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
 
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      AppointmentMailer.appointment_mail(@appointment).deliver_now
      redirect_to root_path
    else

      redirect_to rent_properties_path
    end

  end

  def update

    @appointment = Appointment.find(params[:id])
  
    if params[:status]
      if @appointment.update({"status" => params[:status].to_i})
        redirect_to user_profile_path(current_user.id)
      else
        render  status: :unprocessable_entity
      end
    else
      if @appointment.update({"visit_status" => params[:visit_status].to_i})
        redirect_to user_profile_path(current_user.id)
      else
        render  status: :unprocessable_entity
      end
    end

  end

  def destroy
    @user = current_user
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_profile_path(@user.id), status: :see_other
  end

  protected
  def appointment_params
    params.permit(:name, :phone, :date, :time, :property_id)
  end
end
