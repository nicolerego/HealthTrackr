class DoctorsController < ApplicationController
  def index
    @doctors = current_user.doctors
  end

  def show
    @doctor = current_user.doctors
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
   @doctor = Doctor.new(doctor_params)
   @doctor.user_id = current_user.id
   if @doctor.save
      redirect_to :profile, notice: "Doctor was added!"
    else
       flash.now[:alert] = "Error saving doctor"
      render :new
    end 
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      redirect_to :profile
    else
      render :edit
    end 
    
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :title, :phone, :alt_phone, :address, :id)
  end 

end
