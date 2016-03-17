module Authenticable
  def current_user
    authenticate_with_http_token do |token, options|
      @current_user ||= User.find_by(authentication_token: token)
    end
  end

  def authenticate_with_token!
    render json: {'errors' => 'Not authenticated'}, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end
end
