class AdminController < ApplicationController
  before_filter :authenticate_admin
  respond_to :html, :xml, :json, :js	

  def index
  	@profiles = Profile.doctors
    respond_with(@profile)
  end

  def set_permission
  	doctor = DoctorProfile.find(params[:profile_id])
  	doctor.update_attributes(:status => get_status)
	flash[:notice] = "Status changed!"
  end

  private

  def get_status
  	if params['status'] == "true"
  	  true
  	else
  	  false
  	end
  end
  
  def authenticate_admin
	if current_user
	  unless current_user.is_admin?
		redirect_to root_path, :notice => 'You are not authorize to access this page.'
	  end
	else
	  redirect_to root_path, :notice => 'You are not authorize to access this page.'
	end
  end
end
