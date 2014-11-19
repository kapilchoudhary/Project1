class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def index
    if current_user.is_doctor?
      @stripe_client_id = ENV['CLIENT_ID']
      @pendind_permissions = current_user.try(:profile).try(:doctor_profile).stripe_access_creds.where(:access_token => nil)
      @received_payments = current_user.try(:profile).try(:doctor_profile).stripe_access_creds.where(:paid => true)
      @pendind_payments = current_user.try(:profile).try(:doctor_profile).stripe_access_creds.where("access_token IS NOT NULL")
      render 'doctors_payment'
    elsif current_user.is_patient?
      @ready_for_payments = current_user.stripe_access_creds.where("access_token IS NOT NULL AND paid =?", false)
      @paid_payments = current_user.stripe_access_creds.where(:paid => true)
      render 'patients_payment'
    end
  end

  def initiate_payment
    profile = Profile.find(params[:doctor_id])
    StripeAccessCred.create(:doctor_profile_id => profile.doctor_profile.id, :patient_id => current_user.id )
    redirect_to payments_path, :notice => 'Have send request!'
  end

  def access_setup
	  access_cred = StripeAccessCred.where(id: params['state']).first
	  access_cred.access_token = params['code']
	  if access_cred.save
			flash[:notice] = "You have completed your account setting!"
	  else
			flash[:notice] = "You have completed your account setting!"
	  end
	  redirect_to profile_path(current_user.profile)
  end

  def transaction_fees
		# Get the credit card details submitted by the form
		token = params[:payment][:stripe_card_token]

		# This fetches payment code
		payment_info = StripeAccessCred.where(:id => params[:payment_id]).first

		if payment_info
			begin
				response = HTTParty.post("https://connect.stripe.com/oauth/token?client_secret=#{ENV['CLIENT_SECRET']}&code=#{payment_info.access_token}&grant_type=authorization_code")
				unless response['error']
					# Create the charge on Stripe's servers - this will charge the user's card
					charge = Stripe::Charge.create({
							:amount => 1000,
							:currency => "usd",
							:card => token,
							:description => "payinguser@example.com",
							:application_fee => 23},
							response['access_token']
						)
					if charge.paid
            payment_info.paid = true
            payment_info.save!
        		flash[:notice] = "Fee successfully submitted!"
        	else
						flash[:error] = charge.failure_message
					end
				else
					flash[:error] = response['error_description']
				end
			rescue Exception => e
				# Need to manage a log file for this
				flash[:error] = "Something went wrong!"
			end
		else
			flash[:error] = "Doctor's stripe info is not setup!"
		end
    redirect_to payments_path
  end
end
