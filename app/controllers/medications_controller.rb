class MedicationsController < ApplicationController
 def index
    @medications = current_user.medications
    # @medication = Medication.find(params[:id])
  end

  def show
    @medication = current_user.medications
  end

  def new
    @medication = Medication.new
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def create
   @medication = Medication.new(medication_params)
   @medication.user_id = current_user.id
   if @medication.save
      redirect_to :profile, notice: "Medication was added!"
    else
       flash.now[:alert] = "Error saving medication"
      render :new
    end 
  end

  def update
    @medication = Medication.find(params[:id])
    if @medication.update_attributes(medication_params)
      redirect_to :profile
    else
      render :edit
    end 
    
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path
  end

  private
  def medication_params
    params.require(:medication).permit(:name, :amount, :started_at, :ended_at, :id)
  end 

end
