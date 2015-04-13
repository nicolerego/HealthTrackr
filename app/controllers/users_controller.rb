class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]
 
  def index
    @users = User.all
  end

  def show
     @medications = current_user.medications
     @doctors = current_user.doctors
     # @doctor = @doctors.find(params[:id])
     @appointments = current_user.appointments

     @recent = Appointment.most_recent.map {|appt| appt.date.strftime('%b %d, %Y')}
     @recent_doctor = Appointment.most_recent.map {|appt| appt.doctor.name}

     @next = Appointment.next_appt.map {|appt| appt.date.strftime('%b %d, %Y')}
     @next_doctor = Appointment.next_appt.map {|appt| appt.doctor.name}
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        auto_login(@user)
        format.html { redirect_to :profile, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      # @user = User.find(params[:id])
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :crypted_password, :salt)
    end
end
