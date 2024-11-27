module Authentication
  extend ActiveSupport::Concern

 def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token.present?
      begin
        payload = JWT.decode(token, Rails.application.credentials.secret_key_base).first
        @current_user = User.find(payload['user_id'])
      rescue JWT::DecodeError
        render json: { errors: 'Invalid or expired token' }, status: :unauthorized
      end
    else
      render json: { errors: 'Missing token' }, status: :unauthorized
    end
 end

  def current_user
    @current_user
  end
  
end
