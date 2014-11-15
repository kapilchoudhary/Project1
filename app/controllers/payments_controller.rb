class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def access_setup
    binding.pry
    unless current_user.profile.stripe_access_cred
      access_cred = current_user.profile.doctor_profile.build_stripe_access_cred
      access_cred.access_token = params['code']
      if access_cred.save
        flash[:notice] = "You have completed your account setting!"
      else
        flash[:notice] = "You have completed your account setting!"
      end
      redirect_to profile_path(current_user.profile)
    end
  end

  def transaction_fees
    # Get the credit card details submitted by the form
    token = params[:payment][:stripe_card_token]

    # Need to write code to fetch @payment_code code from db
    response = HTTParty.post("https://connect.stripe.com/oauth/token?client_secret=#{ENV['CLIENT_SECRET']}&code=#{@payment_code}&grant_type=authorization_code")
    
    # Need to write code to fetch ACCESS_TOKEN from above response
    # Create the charge on Stripe's servers - this will charge the user's card
    charge = Stripe::Charge.create({
        :amount => 1000, # amount incents
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com",
        :application_fee => 123 # amount incents
      },
      ACCESS_TOKEN #ACCESS_TOKEN # user's access token from the Stripe Connect flow
    )
  end
end
