class AppointmentController < ApplicationController
  def new 
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def index
  	@appointment = current_user.appointments.find(params[:id])
  	render json: {data: @appointment}
  end

  def create 
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      AppointmentMailer.appointment_mail(@appointment).deliver_now
      render json:{data: @appointment, message: "Appointment created successfully"}
    else
      render json:{error: "Something went wrong"}
    end

  end

  def update
    @appointment = Appointment.find(params[:id])
    if params[:status]
      if @appointment.update({"status" => params[:status].to_i})
        render json: {data: @appointment.status,message: "status updated successfully"}
      else
        render json:{error: "Something went wrong",status: :unprocessable_entity}
      end
    else
      if @appointment.update({"visit_status" => params[:visit_status].to_i})
        render json: {data: @appointment.visit_status,message: "visit status updated successfully"}
      else
        render json:{error: "Something went wrong",status: :unprocessable_entity}
      end
    end

  end

  def destroy
    @user = current_user
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    render json: {message: "deleted successfully", status: :see_other}
  end

  protected
  def appointment_params
    params.permit(:name, :phone, :date, :time, :property_id)
  end
end
