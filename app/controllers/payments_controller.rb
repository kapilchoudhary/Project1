class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def access_setup
	  access_cred = StripeAccessCred.new(doctor_profile_id: current_user.profile.doctor_profile)
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
		payment_info = StripeAccessCred.all.order(:created_at => :asc).last

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
  end
end
