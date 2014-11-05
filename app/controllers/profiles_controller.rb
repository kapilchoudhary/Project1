class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @profiles = Profile.all
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
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :city, :speciality, :image)
    end
end
