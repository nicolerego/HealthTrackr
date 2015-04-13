class AppointmentsController < ApplicationController
   def index
    @doctors = current_user.doctors
    @appointments = current_user.appointments
  end

  def show
    @appointment = current_user.appointments
  end

  def new
    @appointment = Appointment.new
    @doctors = current_user.doctors
  end

  def edit
    @doctors = current_user.doctors
    @appointment = Appointment.find(params[:id])
  end

  def create
   @appointment = Appointment.new(appointment_params)
   @appointment.user_id = current_user.id
   if @appointment.save
      redirect_to :profile, notice: "Appointment was added!"
    else
       flash.now[:alert] = "Error saving appointment"
      render :new
    end 
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      redirect_to :profile
    else
      render :edit
    end 
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointment_path
  end

  def history 
    @doctors = current_user.doctors
    @appointments = current_user.appointments
  end 

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :note, :doctor_id, :id)
  end 
end
