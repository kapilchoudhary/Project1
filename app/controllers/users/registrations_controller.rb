class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :disable_simple_signup, only: [:new]

  # This action will redirect to home page
  def new

  end
  
  # This action is to create new doctor
  def new_doctor
    session[:user_type] = Profile::DOCTOR
    @user = build_resource

    render 'new_doctor'
  end

  # This action is to create new patient
  def new_patient
    session[:user_type] = Profile::PATIENT
    @user = build_resource

    render 'new_patient'
  end

  # This action will register doctor and patient both
  def create
    build_resource(sign_up_params)

    resource.profile_type = session[:user_type]
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render 'users/registrations/new_'.concat(session[:user_type])
    end
  end

  # This action will update doctor and patient both
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      render template: 'users/registrations/edit_'.concat(resource.profile_type)
    end
  end

  # Render patient edit page
  def edit_patient
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    render 'users/registrations/edit_patient'
  end

  # Render doctor edit page
  def edit_doctor
    render 'users/registrations/edit_doctor'
  end

  private

  def disable_simple_signup
    redirect_to root_path
  end

  # my custom fields are
  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation)
  end

  private

  def after_sign_up_path_for(resource)
    edit_profiles_path
  end
end
