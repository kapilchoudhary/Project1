class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :complete_profile_info, only: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @profiles = Profile.doctors
    respond_with(@profile)
  end

  def show
    respond_with(@profile)
  end

  def new
    if current_user.profile.nil?
      @profile = Profile.new 
      respond_with(@profile)
    else
      redirect_to profiles_path, notice: "You can only create one profile as a user"
    end
  end

  def edit
    if current_user.is_doctor?
      @profile.build_doctor_profile unless @profile.doctor_profile
    else
      patient_profile = @profile.patient_profile || @profile.build_patient_profile 
      patient_profile.try(:allergy) || patient_profile.build_allergy
      patient_profile.try(:medication) || patient_profile.build_medication
      patient_profile.try(:previous_dignosed_condition) || patient_profile.build_previous_dignosed_condition
    end
  end

  def create
    @profile = Profile.create({
        name: params['profile']['name'],
        speciality: params['profile']['speciality'],
        city: params['profile']['speciality'],
        user_id: current_user['id']
      })
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  def correct_user
    @profile = current_user.profile(id: params[:id])
    redirect_to profiles_path, notice: "Not authorized to edit this profile." if @profile.nil?
  end

  private

  def set_profile
    unless current_user
      @profile = Profile.find(params[:id])
    else 
      @profile = current_user.profile
    end
  end

  def profile_params
    if current_user.is_doctor?
      params.require(:profile).permit(:name, :city, :state, :image, doctor_profile_attributes: 
                          [:profile_id, :speciality, :year_of_completion, :gratuate_school, :degree, :professional_license])
    else
      params.require(:profile).permit(:name, :city, :state, :image, 
                                      patient_profile_attributes: [:profile_id, :gender,:date_of_birth, :location, 
                                      allergy_attributes: [:name, :note], medication_attributes: [:name, :note], 
                                      previous_dignosed_condition_attributes: [:name, :note] ])
    end
  end

  def complete_profile_info
    redirect_to edit_profiles_path, notice: "Please complete your profile first!." unless current_user.profile_completed?
  end
end
