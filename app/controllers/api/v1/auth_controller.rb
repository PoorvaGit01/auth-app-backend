class Api::V1::AuthController < ApplicationController
  def signup
    referral_token = params[:referral_token]
    referred_by = User.find_by(referral_token: referral_token) if referral_token.present?

    # Create a new user
    @user = User.new(user_params)
    @user.invited_by = referred_by if referred_by

    if @user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def login
        @user = User.find_by_email(params[:email])
        if @user&.valid_password?(params[:password])
          token = generate_jwt(@user)
          render json: { token: token }, status: :ok
        else
          render json: { errors: 'Invalid email or password' }, status: :unauthorized
        end
  end

  private

  def generate_jwt(user)
    JWT.encode(
      { user_id: user.id, exp: 24.hours.from_now.to_i },
      Rails.application.credentials.secret_key_base
    )
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
  
end

