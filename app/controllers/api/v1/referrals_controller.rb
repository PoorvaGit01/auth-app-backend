class Api::V1::ReferralsController < ApplicationController
  before_action :authenticate_user!

  include Rails.application.routes.url_helpers

  def send_email
    invited_email = params[:email]
    inviter = current_user
    referral_link = "#{Rails.application.config.default_host}/signup?referral_token=#{SecureRandom.hex(10)}"

    if invited_email.present?
      # Send the email (using ReferralMailer)
      ReferralMailer.send_referral(invited_email, inviter.email, referral_link).deliver_now
      render json: { message: 'Referral email sent successfully!' }, status: :ok
    else
      render json: { errors: 'Email is required' }, status: :unprocessable_entity
    end
  end
end
